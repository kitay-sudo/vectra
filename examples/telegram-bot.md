# Telegram bot profile

**Goal:** deliver appointment reminders through a Telegram bot. **Context:** platform rate limits, webhook security, user locale, and deletion policy are volatile facts with verification dates. **Authority:** owner approves message copy and personal-data handling; agent may implement and test locally.

Iterations: validate bot interaction states; implement one state transition; test duplicate updates and retries; review consent and error copy; update known platform behavior. Success evidence includes idempotency, timezone boundaries, rate-limit recovery, secret handling, and a tested disable path.

Anti-pattern: copying a bot token into `MEMORY.md` or task logs.
