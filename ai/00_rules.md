# AI Workflow Rules

This project uses a sequential local AI workflow:

1. Planner proposes a small, testable implementation plan.
2. Coder implements only the approved plan.
3. Reviewer inspects changed files, tests, edge cases, and consistency with the plan.
4. Human decides whether to keep, revise, or restore from snapshot.

## Hard Rules

- Do not rewrite unrelated files.
- Do not perform broad refactors unless explicitly requested.
- Prefer small, testable changes.
- Preserve existing behavior unless the task says otherwise.
- Update tests when behavior changes.
- Run available tests or explain why they could not run.
- Record all meaningful changes in `ai/implementation_log.md`.
- Reviewer must be skeptical and specific.
- Do not claim success unless tests or direct inspection support it.

## Output Discipline

- Planner writes only to `ai/current_plan.md`.
- Coder writes source/tests and `ai/implementation_log.md`.
- Reviewer writes only to `ai/review_notes.md` unless told otherwise.

- Record every changed file in `ai/implementation_log.md`.
- Avoid broad file rewrites.
