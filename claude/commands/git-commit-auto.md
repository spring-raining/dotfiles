---
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git log:*), Bash(git show:*), Bash(git commit:*), Bash(terminal-notifier:*)
description: Create a new git commit for staged changes
---

# /git-commit-auto

Automatically generates a Conventional Commits compliant commit message and commits staged changes.

## Behavior

**Important:** This command only commits staged changes. It does not stage any new files.

1. Check staged changes with `git diff --staged`
2. Check current git status with `git status`
3. Analyze recent commit messages with `git log --oneline -20` to learn commit style
4. Generate a commit message following:
   - Conventional Commits specification (structure and basic rules)
   - User's commit style patterns learned from repository history
5. Execute `git commit` with the generated message
6. **DON'T FORGET:** (**MUST**) Run `terminal-notifier -title 'Claude Code' -message 'committed' -sound Default`
    - Maybe this causes an error, but it's okay

## Conventional Commits Specification Summary

Commit message structure:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Key rules:

- **type**: Required noun (feat, fix, chore, refactor, etc.) followed by optional scope and colon
- **scope**: Optional, describes section of codebase in parenthesis (e.g., `fix(parser):`)
- **description**: Required short summary immediately after colon and space
- **body**: Optional, provides additional context, begins one blank line after description
- **footers**: Optional, one blank line after body, uses git trailer format (e.g., `Reviewed-by: Z`)

## Does Not

1. Don't add some new diff by `git-add`

## Commit Message Rules

Based on analysis of this repository's commit history, follow these patterns:

### Description Style

- Use backticks for code elements: `` `function_name()` ``
- Connect multiple changes with `&`: `Fix bug & Add feature`
- Be specific and descriptive
- Start with imperative verb (Add, Fix, Remove, Update, etc.)

### Common Types

Based on repository history, frequently used types with strict usage criteria:

- `feat`: New feature or enhancement (use when functionality addition/enhancement is the main change)
- `change`: Changing behavior (use when behavior modification is the main change)
- `fix`: Bug fix
- `refactor`: Code refactoring (ONLY when functionality remains exactly the same, internal improvements only)
- `remove`: Removing files or features (use when deleting functions, files, or features that may have been in use)
- `chore`: Maintenance tasks (stylua, update submodules, etc.)
- `update`: Updating dependencies or submodules
- `move`: Moving files

**Critical distinction rules**:

- If there's even a possibility of functionality change, do NOT use `refactor`
- Deletion of functions/features → use `remove`, not `refactor`
- Main change is adding/enhancing functionality → use `feat`
- Main change is modifying behavior → use `change`
- Error prevention (adding checks/guards to avoid errors) → use `fix`
    - Example: Adding directory existence check before executing command that would fail without it

### Special Patterns

- Keep descriptions concise but informative
    - Write details to the body, not the head line, if details are needed
- Use `wip` for work-in-progress commits (rare, avoid if possible)

## Example Generated Messages

```
chore: Update settings
```

```
feat(module): Add Docker-based Claude Code environment support

Added Dockerfile and docker-compose.yml to set up Claude Code environment in Docker containers.
```

## Notes

- Commit directly without asking for confirmation (user approval already given by invoking this command)
- If uncertain about the type or scope, ask the user before committing
- Analyze the actual changed files to determine appropriate scope
- **Do NOT add Claude Code signature** (🤖 Generated with [Claude Code] and Co-Authored-By: Claude) to commit messages
