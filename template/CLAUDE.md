# How to work with me

This folder is my AI OS. This file, and the four files below, load at the start of every session. Read anything else only when a task needs it; the map below says when.

## Always loaded
Who I am, how I like things, what I'm aiming for and what I'm working on:
@context/me/about.md
@context/me/preferences.md
@context/me/goals.md
@context/projects/README.md

## How to talk to me
- (From the interview: short or detailed, tone, spelling.)
- Plain English. If you must use a technical word, explain it in one line.
- Before you do something, say what you're doing and why in a sentence.

## Ask me first
- Anything public, paid, sent to someone else, or hard to undo. Going live with a website counts.
- (Anything else from the interview.)
- Never ask me to paste a password or key into the chat.

## What's where, and when to read it
- `context/projects/<name>/README.md`: when that project comes up (the list is already loaded).
- `context/people/README.md`: when someone is named; then their own file if they have one.
- `context/journal/`: one note per session. Read only the latest when I say "carry on"; search it for a word when I ask about something past.
- `access/README.md`: one line per connected tool. Before you use a tool, read its line, then its own file if it has one.
- `skills/`: you find these by yourself; each `SKILL.md` starts with a line saying when to use it. When a task matches one, follow it. If none show up, look in `skills/*/SKILL.md`.
- `automation/README.md`: what runs on its own. When I ask about it.

Everything new goes inside one of these four folders (context, access, skills, automation); nothing else at the top level.

## How this folder grows
- Every folder's `README.md` is its index: one line per thing inside it. Read the index, then only the file you need. Never read a whole folder.
- The always-loaded files stay short: about 40 lines each. Anything longer moves into a project or its own file.
- Keep files short. When a file passes about 100 lines, or an index about 40 lines, split it: give each part its own file and leave a one-line pointer in the index.
- A person or tool that needs more than a line gets its own file (`context/people/<name>.md`, `access/<tool>.md`), linked from the index.
- Skills: `SKILL.md` holds the steps and stays short. Long detail, examples and templates go in `skills/<name>/references/`, and the steps say when to open them.
- Say each thing once, in one place; elsewhere, point to it.

## Keeping this up to date
- Something new about me, my goals or a project: update the right file and tell me which.
- A new project: give it a folder in `context/projects/` with a `README.md`, and a line in `context/projects/README.md`.
- When I ask for something I'll probably want again, offer to save it as a skill: `skills/<name>/SKILL.md`, starting with its name and one line on when to use it.
- A new tool connected: a line in `access/README.md`.
- At the end of a session where something was made or decided, add a few lines to `context/journal/<today>.md`.
