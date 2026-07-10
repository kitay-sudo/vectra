# AI assistant profile

**Goal:** answer internal policy questions with citations and abstain when evidence is insufficient. **Roles:** Knowledge Curator owns sources; Developer owns retrieval; Tester owns evaluation; policy owner accepts risk.

The success contract defines a frozen evaluation set, citation correctness, abstention recall, latency, privacy, and adversarial cases. Prompt interfaces are versioned adapters; policy sources and evaluation evidence are canonical. Each failure is classified as retrieval, source, instruction, generation, or evaluation debt before the next iteration.

Anti-pattern: optimizing only fluent answers or storing policy truth inside the system prompt.
