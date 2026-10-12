---
name: codex-reasonix-collaboration
description: Configure and use Codex planning plus DeepSeek Flash execution with final Codex review. Use for coding tasks that should be delegated to Reasonix while Codex retains architecture and acceptance control.
---

# Codex + Reasonix collaboration

Use this skill for every task after it is installed, unless the user explicitly requests a single-model workflow.

## 1. Check the environment first

Run:

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\.codex\skills\codex-reasonix-collaboration\scripts\setup-reasonix.ps1" -PromptForApiKey
```

The script checks Codex, the DeepSeek provider, the Reasonix profile, and `DEEPSEEK_API_KEY`. If the key is missing, ask the user to enter it interactively. Never put it in a repository, prompt file, or skill file.

If prerequisites cannot be installed automatically, report the exact missing command and pause before changing project files.

## 2. Plan with Codex

Inspect the repository and write a concise `PLAN.md` in the project root containing target files, constraints, implementation steps, validation commands, risks, and non-goals. Do not delegate architecture, security, migration, or public API decisions without Codex review.

## 3. Execute with Reasonix

Run the execution model only through the profile below; it is fixed to `deepseek-flash`:

```powershell
codex -p reasonix exec "Read PLAN.md. Implement it strictly. Run the listed tests. Do not expand scope. Report changed files, tests, and unresolved issues."
```

Reasonix may edit files and run tests, but must stop and report any request to broaden scope or make an architecture decision.

## 4. Final Codex review

Review `PLAN.md`, `git diff`, `git status`, and test output with the default Codex model. Check requirements, scope, regressions, security, and test coverage. Require fixes for must-have issues; do not declare success based only on Reasonix's report.

## 5. Handoff protocol

Use these files as the cross-model protocol when useful: `PLAN.md` for the Codex plan, `EXECUTION.md` for the Reasonix summary, and `TEST_RESULT.md` for commands and results. Keep API keys and authentication files outside the repository.
