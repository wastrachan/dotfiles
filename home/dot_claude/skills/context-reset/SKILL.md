# Skill: Context Reset / Handoff Doc

## Purpose

When a Claude Code session grows large and context is getting expensive or noisy, this skill produces a clean, structured markdown handoff document. A fresh agent can read it and pick up exactly where the current session left off — no re-explaining required.

## Trigger

The user says any of the following (case-insensitive):

- "Generate handoff doc"
- "Reset context"
- "Create handoff"
- "Context dump"
- "Start fresh" (when used in the context of continuing work in a new session)

## Behavior

When triggered, do NOT ask clarifying questions. Silently scan the full conversation history and produce the handoff document immediately. The document should be self-contained — a cold-start agent reading only this doc should have everything they need.

Extract and synthesize information in this priority order:

1. **Current task** — What are we actively building right now? Include the specific goal, not a vague summary. If there's a partially-complete implementation, describe where it was left off.
2. **Design decisions & rationale** — Every meaningful architectural or design choice that was made, and _why_. This is the most valuable context for a new agent. Include things the user explicitly decided, and strong implicit choices that shaped the implementation.
3. **File & code locations** — Relevant file paths, key functions/classes/components, and how they relate to the feature being built.
4. **What's been tried / dead ends** — Approaches that were explored and abandoned. Include _why_ they didn't work so the new agent doesn't re-investigate them.
5. **Open questions & blockers** — Anything unresolved, decisions not yet made, or external dependencies that are blocking progress.

## Output Format

Output a single fenced markdown code block (so the user can copy it cleanly). The document itself uses the following structure:

```
# Handoff: [Feature Name]

> Generated from session on [date if known, otherwise omit]. Paste this at the start of a new Claude Code session.

## Current Task
[1–3 sentences. What are we building, and where did we stop?]

## Design Decisions
[Bullet list. Each entry: the decision, then the rationale after a dash. Be specific.]
- [Decision] — [Why]
- ...

## Relevant Files & Code
[Bullet list of paths and what's in them. Include function/class names where helpful.]
- `path/to/file.ts` — [what lives here and why it matters]
- ...

## Dead Ends
[Bullet list of approaches tried and rejected, with reason.]
- Tried [X] — didn't work because [Y]
- ...
(Omit this section entirely if nothing was abandoned.)

## Open Questions
[Bullet list of unresolved decisions or blockers.]
- [Question or blocker]
- ...
(Omit this section entirely if nothing is unresolved.)
```

## Quality Rules

- **Be specific, not summarizing.** "We decided to use the Host header for tenant extraction rather than a frontend JS approach, because it prevents tenant spoofing" is good. "We talked about authentication" is useless.
- **Omit dead sections.** If there are no dead ends or open questions, leave those sections out entirely — don't include empty headers.
- **No preamble.** Don't say "Here is your handoff document" or explain what you're doing. Just output the fenced markdown block.
- **Keep it dense.** A new agent's context window is precious. Every line should earn its place.
- **Use actual names.** Reference real file paths, real function names, real variable names from the conversation — not placeholders.

## Example Output (abbreviated)

```markdown
# Handoff: Wildcard Subdomain Routing

## Current Task

Implementing tenant-aware routing in a GKE cluster using the Gateway API. Currently wiring up the HTTPRoute to extract the subdomain from the `Host` header and forward it as an `X-Tenant-ID` header to backend services. Stopped just before writing the RequestHeaderModifier filter.

## Design Decisions

- Use `Host` header (not `window.location.hostname`) for tenant extraction — prevents client-side spoofing, keeps tenant resolution server-authoritative
- Gateway API over Ingress — needed `RequestHeaderModifier` and `URLRewrite` filters that Ingress doesn't support
- Single shared Gateway, per-tenant HTTPRoutes — allows tenant onboarding without redeploying the Gateway

## Relevant Files & Code

- `k8s/gateway.yaml` — GKE Gateway resource, class `gke-l7-global-external-managed`
- `k8s/httproute-tenant.yaml` — HTTPRoute template; `hostnames` uses wildcard `*.businesstrades.com`
- `services/tenant-resolver/main.go` — reads `X-Tenant-ID` header, looks up tenant config in Firestore

## Open Questions

- Whether to validate `X-Tenant-ID` at the Gateway level (via a policy) or trust the backend to reject unknown tenants
```
