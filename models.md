# Y7 OS — Model Compatibility

## Choosing a Model

The right model depends on three things: your RAM, your use case, and whether you need Arabic support.

## Quick Reference

| RAM Available | Best Choice | Arabic? | Command |
|---|---|---|---|
| 1 GB | TinyLlama | ❌ | `y7-models download tinyllama` |
| 3 GB | Gemma 2B | ❌ | `y7-models download gemma2b` |
| 4 GB | Phi-3 Mini | Partial | `y7-models download phi3` |
| 6 GB | Qwen2 7B | ✅ Best | `y7-models download qwen2` |
| 6 GB | Llama 3.1 8B | ✅ Good | `y7-models download llama3` |
| 16 GB+ | Llama 3.1 70B | ✅ Best | `y7-models download llama370b` |

Or just run: `y7-models recommend` — it detects your hardware and suggests automatically.

---

## Full Model Matrix

### TinyLlama 1.1B
- **Size:** ~600MB | **Min RAM:** 1GB | **Arabic:** ❌
- Extremely small. Use only when RAM is severely limited.
- Good for: simple Q&A, short completions
- Avoid for: complex reasoning, Arabic, long conversations

### Gemma 2B (Google)
- **Size:** ~1.5GB | **Min RAM:** 3GB | **Arabic:** ❌
- Fast and efficient. Better reasoning than TinyLlama.
- Good for: summaries, quick tasks, English chat
- Avoid for: Arabic, complex multi-step tasks

### Phi-3 Mini 3.8B (Microsoft)
- **Size:** ~2.3GB | **Min RAM:** 4GB | **Arabic:** Partial
- **Recommended default for 4GB devices.**
- Punches well above its weight class in reasoning.
- Good for: coding help, general Q&A, summarization
- Arabic works but with errors — not recommended for Arabic-primary use

### Mistral 7B Q4
- **Size:** ~4.1GB | **Min RAM:** 6GB | **Arabic:** Partial
- Strong general-purpose model. Very popular in the open-source community.
- Good for: writing, analysis, coding, instruction-following
- Arabic: better than Phi-3 but still not ideal

### Llama 3.1 8B Q4 (Meta)
- **Size:** ~4.7GB | **Min RAM:** 6GB | **Arabic:** ✅ Good
- Excellent all-rounder. Best balance of quality and Arabic support in this size range.
- Good for: almost everything — writing, coding, Arabic chat, analysis
- **Recommended for Arabic users with 6GB+ RAM**

### Qwen2 7B Q4 (Alibaba)
- **Size:** ~4.4GB | **Min RAM:** 6GB | **Arabic:** ✅ Best in class
- Trained on significantly more Arabic + multilingual data than competitors.
- Slightly better Arabic than Llama 3.1 8B in most benchmarks.
- Good for: Arabic tasks, multilingual use, general purpose
- **Top recommendation for Arabic-primary users**

### CodeLlama 7B Q4
- **Size:** ~3.8GB | **Min RAM:** 6GB | **Arabic:** ❌
- Specialized for code. Better at programming tasks than general models.
- Good for: code generation, debugging, code explanation
- Not for: general conversation, Arabic

### DeepSeek Coder 6.7B
- **Size:** ~3.8GB | **Min RAM:** 6GB | **Arabic:** ❌
- Strong code model, competitive with CodeLlama.
- Good for: code generation, refactoring, technical explanations

### Llama 3.1 70B Q4 (Meta)
- **Size:** ~40GB | **Min RAM:** 48GB | **Arabic:** ✅ Best
- Near-GPT-4 quality on many benchmarks. Excellent Arabic.
- Requires high-end hardware — not a Y7 OS primary target
- Available for users with sufficient RAM

---

## Quantization Notes

Y7 OS defaults to **Q4_K_M** quantization — 78% size reduction with acceptable quality loss.

| Format | RAM Saved | Quality | When to Use |
|---|---|---|---|
| F16 | 50% | Perfect | >16GB RAM |
| Q8_0 | 65% | Excellent | 8–16GB |
| Q5_K_M | 72% | Very good | 6–8GB |
| **Q4_K_M** | **78%** | **Good** | **Y7 OS default** |
| Q3_K_M | 82% | Fair | <4GB only |
| Q2_K | 88% | Poor | Last resort |

---

## Arabic Language Notes

Arabic NLP is harder than English because:
1. Arabic is morphologically rich — one root produces dozens of word forms
2. Most training data is English-dominant
3. MSA (Modern Standard Arabic) ≠ dialectal Arabic

**Best models for Arabic in order:**
1. Qwen2 7B — best Arabic training data coverage
2. Llama 3.1 8B — Meta invested in multilingual training
3. Mistral 7B — partial Arabic, acceptable quality
4. Phi-3 Mini — basic Arabic, use only on 4GB devices with no alternative

**Dialectal Arabic note:**
All models perform better on MSA than Gulf, Levantine, or Egyptian dialects. Qwen2 handles dialects better than the others.
