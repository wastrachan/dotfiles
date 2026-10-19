## Skills

- Context reset / handoff: ~/.claude/skills/context-reset/SKILL.md
  Trigger: "Generate handoff doc"

## Python

- On Python 3.14+ targets, `except A, B:` — a tuple of exception types with NO parentheses and no `as` binding — is valid PEP 758 syntax, equivalent to `except (A, B):`. ruff normalizes to the parens-less form. Do NOT mistake it for the Python-2 `except E, name:` form or flag it as a SyntaxError. Verify against the actual interpreter (`python -m py_compile`) before claiming any syntax problem.
