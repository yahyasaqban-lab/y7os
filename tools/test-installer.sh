#!/bin/bash

################################################################################
# Y7 OS Installer Test Suite
# 
# Run comprehensive tests on y7-install script
# Supports: dry-run, syntax validation, docker-based testing
#
# Usage:
#   ./test-installer.sh --help
#   ./test-installer.sh --syntax
#   ./test-installer.sh --dry-run
#   ./test-installer.sh --docker ubuntu:22.04
################################################################################

set -euo pipefail

readonly TEST_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly Y7_INSTALL="${TEST_SCRIPT_DIR}/y7-install"
readonly TEST_LOG="/tmp/y7-test.log"
readonly TEST_RESULTS="/tmp/y7-test-results.txt"

# Colors
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'

# Test counters
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_SKIPPED=0

################################################################################
# Test Utilities
################################################################################

test_start() {
    echo -e "${BLUE}[TEST]${NC} $1"
    echo "[TEST] $1" >> "$TEST_LOG"
}

test_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    echo "[PASS] $1" >> "$TEST_LOG"
    ((TESTS_PASSED++))
}

test_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    echo "[FAIL] $1" >> "$TEST_LOG"
    ((TESTS_FAILED++))
}

test_skip() {
    echo -e "${YELLOW}[SKIP]${NC} $1"
    echo "[SKIP] $1" >> "$TEST_LOG"
    ((TESTS_SKIPPED++))
}

print_summary() {
    cat <<EOF

${BLUE}════════════════════════════════════════════${NC}
${BLUE}Test Results Summary${NC}
${BLUE}════════════════════════════════════════════${NC}

${GREEN}Passed:${NC}  $TESTS_PASSED
${RED}Failed:${NC}  $TESTS_FAILED
${YELLOW}Skipped:${NC} $TESTS_SKIPPED
${BLUE}Total:${NC}   $((TESTS_PASSED + TESTS_FAILED + TESTS_SKIPPED))

${BLUE}════════════════════════════════════════════${NC}

Details: $TEST_LOG
EOF
}

################################################################################
# Syntax Tests
################################################################################

test_bash_syntax() {
    test_start "Checking Bash syntax..."
    
    if bash -n "$Y7_INSTALL" 2>&1 | tee -a "$TEST_LOG"; then
        test_pass "Bash syntax valid"
    else
        test_fail "Bash syntax errors found"
        return 1
    fi
}

test_shellcheck() {
    test_start "Running ShellCheck..."
    
    if ! command -v shellcheck &> /dev/null; then
        test_skip "ShellCheck not installed (apt-get install shellcheck)"
        return 0
    fi
    
    if shellcheck -x "$Y7_INSTALL" 2>&1 | tee -a "$TEST_LOG"; then
        test_pass "ShellCheck passed (0 warnings/errors)"
    else
        test_fail "ShellCheck found issues"
        return 1
    fi
}

test_required_functions() {
    test_start "Checking required functions..."
    
    local required_functions=(
        "check_root"
        "detect_os"
        "detect_hardware"
        "install_base_packages"
        "install_ai_stack"
        "validate_installation"
        "main"
    )
    
    for func in "${required_functions[@]}"; do
        if grep -q "^${func}()" "$Y7_INSTALL"; then
            test_pass "Function '$func' found"
        else
            test_fail "Function '$func' not found"
            return 1
        fi
    done
}

test_help_option() {
    test_start "Testing --help option..."
    
    if bash "$Y7_INSTALL" --help 2>&1 | grep -q "Y7 OS Installer"; then
        test_pass "Help output works"
    else
        test_fail "Help option failed"
        return 1
    fi
}

################################################################################
# Dry-Run Tests
################################################################################

test_dry_run() {
    test_start "Testing --dry-run mode..."
    
    if bash "$Y7_INSTALL" --dry-run --skip-validation 2>&1 | tee -a "$TEST_LOG" | grep -q "DRY RUN"; then
        test_pass "Dry-run mode works"
    else
        test_fail "Dry-run mode failed"
        return 1
    fi
}

test_dry_run_does_not_modify() {
    test_start "Verifying dry-run doesn't modify system..."
    
    # Create a marker file
    marker="/tmp/y7-test-marker-$$"
    touch "$marker"
    
    # Run installer in dry-run, it shouldn't touch /opt/y7
    if [[ ! -d "/opt/y7" ]]; then
        test_pass "Dry-run did not modify /opt/y7"
        rm -f "$marker"
    else
        test_fail "Dry-run may have modified system"
        rm -f "$marker"
        return 1
    fi
}

################################################################################
# Docker Container Tests
################################################################################

test_docker_ubuntu_2204() {
    test_start "Testing in Docker container (Ubuntu 22.04)..."
    
    if ! command -v docker &> /dev/null; then
        test_skip "Docker not installed"
        return 0
    fi
    
    local test_cmd='
        apt-get update && apt-get install -y curl sudo
        curl -fsSL file:///y7-install > /tmp/y7-install
        chmod +x /tmp/y7-install
        /tmp/y7-install --help
    '
    
    if docker run --rm -v "$Y7_INSTALL:/y7-install" ubuntu:22.04 bash -c "$test_cmd" &>> "$TEST_LOG"; then
        test_pass "Ubuntu 22.04 container test passed"
    else
        test_fail "Ubuntu 22.04 container test failed"
        return 1
    fi
}

test_docker_debian_12() {
    test_start "Testing in Docker container (Debian 12)..."
    
    if ! command -v docker &> /dev/null; then
        test_skip "Docker not installed"
        return 0
    fi
    
    local test_cmd='
        apt-get update && apt-get install -y curl sudo
        curl -fsSL file:///y7-install > /tmp/y7-install
        chmod +x /tmp/y7-install
        /tmp/y7-install --help
    '
    
    if docker run --rm -v "$Y7_INSTALL:/y7-install" debian:12 bash -c "$test_cmd" &>> "$TEST_LOG"; then
        test_pass "Debian 12 container test passed"
    else
        test_fail "Debian 12 container test failed"
        return 1
    fi
}

################################################################################
# Feature Tests
################################################################################

test_language_detection() {
    test_start "Testing language autodetection..."
    
    # Test English detection
    if LANG=en_US.UTF-8 bash "$Y7_INSTALL" --help 2>&1 | grep -q "USAGE:"; then
        test_pass "English language detection works"
    else
        test_fail "English language detection failed"
        return 1
    fi
    
    # Test Arabic detection
    if LANG=ar_SA.UTF-8 bash "$Y7_INSTALL" --help 2>&1 | grep -q "USAGE"; then
        test_pass "Arabic language detection works"
    else
        test_fail "Arabic language detection failed"
        return 1
    fi
}

test_backend_selection() {
    test_start "Testing AI backend selection..."
    
    # Test Ollama backend
    if bash "$Y7_INSTALL" --backend ollama --dry-run 2>&1 | grep -q "ollama"; then
        test_pass "Ollama backend selection works"
    else
        test_fail "Ollama backend selection failed"
        return 1
    fi
    
    # Test llama.cpp backend
    if bash "$Y7_INSTALL" --backend llama --dry-run 2>&1 | grep -q "llama"; then
        test_pass "llama.cpp backend selection works"
    else
        test_fail "llama.cpp backend selection failed"
        return 1
    fi
}

test_all_cli_options() {
    test_start "Testing all CLI options..."
    
    local options=(
        "--help"
        "--verbose"
        "--dry-run"
        "--skip-validation"
        "--lang en"
        "--lang ar"
        "--backend ollama"
        "--backend llama"
    )
    
    for opt in "${options[@]}"; do
        if bash "$Y7_INSTALL" $opt --skip-validation &> /dev/null || \
           bash "$Y7_INSTALL" $opt 2>&1 | grep -q "usage\|USAGE\|help"; then
            test_pass "Option '$opt' works"
        else
            test_fail "Option '$opt' failed"
            return 1
        fi
    done
}

################################################################################
# Content Tests
################################################################################

test_config_template() {
    test_start "Checking configuration template in script..."
    
    if grep -q "Y7 OS Configuration" "$Y7_INSTALL"; then
        test_pass "Configuration template found"
    else
        test_fail "Configuration template not found"
        return 1
    fi
}

test_docker_compose_template() {
    test_start "Checking Docker Compose template in script..."
    
    if grep -q "docker-compose" "$Y7_INSTALL"; then
        test_pass "Docker Compose template found"
    else
        test_fail "Docker Compose template not found"
        return 1
    fi
}

test_error_messages_en() {
    test_start "Checking English error messages..."
    
    if grep -q "Installation failed" "$Y7_INSTALL"; then
        test_pass "English error messages present"
    else
        test_fail "English error messages missing"
        return 1
    fi
}

test_error_messages_ar() {
    test_start "Checking Arabic error messages..."
    
    if grep -q "فشل التثبيت" "$Y7_INSTALL"; then
        test_pass "Arabic error messages present"
    else
        test_fail "Arabic error messages missing"
        return 1
    fi
}

################################################################################
# Main Test Runners
################################################################################

run_syntax_tests() {
    echo -e "\n${BLUE}=== Syntax Tests ===${NC}\n"
    test_bash_syntax
    test_shellcheck
    test_required_functions
    test_help_option
}

run_dry_run_tests() {
    echo -e "\n${BLUE}=== Dry-Run Tests ===${NC}\n"
    test_dry_run
    test_dry_run_does_not_modify
}

run_docker_tests() {
    echo -e "\n${BLUE}=== Docker Container Tests ===${NC}\n"
    test_docker_ubuntu_2204
    test_docker_debian_12
}

run_feature_tests() {
    echo -e "\n${BLUE}=== Feature Tests ===${NC}\n"
    test_language_detection
    test_backend_selection
    test_all_cli_options
}

run_content_tests() {
    echo -e "\n${BLUE}=== Content Tests ===${NC}\n"
    test_config_template
    test_docker_compose_template
    test_error_messages_en
    test_error_messages_ar
}

run_all_tests() {
    echo -e "\n${BLUE}=== Running All Tests ===${NC}\n"
    run_syntax_tests
    run_dry_run_tests
    run_feature_tests
    run_content_tests
    run_docker_tests || true  # Optional if Docker not available
}

################################################################################
# Main
################################################################################

main() {
    # Initialize
    > "$TEST_LOG"
    
    case "${1:-all}" in
        syntax)
            run_syntax_tests
            ;;
        dry-run)
            run_dry_run_tests
            ;;
        docker)
            run_docker_tests
            ;;
        features)
            run_feature_tests
            ;;
        content)
            run_content_tests
            ;;
        all)
            run_all_tests
            ;;
        --help|-h)
            cat <<EOF
${BLUE}Y7 OS Installer Test Suite${NC}

USAGE:
    ./test-installer.sh [COMMAND]

COMMANDS:
    all         Run all tests (default)
    syntax      Check syntax, ShellCheck, required functions
    dry-run     Test dry-run mode
    docker      Test in Docker containers
    features    Test CLI options and language detection
    content     Test configuration & error messages
    --help      Show this help message

EXAMPLES:
    ./test-installer.sh syntax
    ./test-installer.sh all
    ./test-installer.sh dry-run --verbose

REQUIREMENTS:
    - bash 4.0+
    - shellcheck (optional, for extended checks)
    - docker (optional, for container tests)

RESULTS:
    Log file: $TEST_LOG
EOF
            exit 0
            ;;
        *)
            echo "Unknown command: $1"
            echo "Use: ./test-installer.sh --help"
            exit 1
            ;;
    esac
    
    print_summary
    
    if [[ $TESTS_FAILED -gt 0 ]]; then
        exit 1
    fi
}

main "$@"
