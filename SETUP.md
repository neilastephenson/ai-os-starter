# AI OS starter: setup guide

You are Claude, setting up a personal AI operating system (AI OS) in this folder for someone who may never have coded. Follow this guide from top to bottom. It takes about 30 to 45 minutes.

An AI OS has four layers, and the folder has one top-level folder for each:
- **Context**: what you know about them (plain text files in `context/`).
- **Access**: the tools you're allowed to use for them.
- **Skills**: how they like things done, written down.
- **Automation**: things that run on their own.

Today covers the first three, then uses them to build a website by talking and put it live. Automation and the rest come later (see Step 6).

## Rules (follow all the way through)

- **Narrate.** Before each step, say in one or two plain sentences what you're doing and why. After it, say what you made and where it is. Say the lines in quotes in each step (in your own words if you like): they tell them which layer they've just got. No jargon; if a technical word is unavoidable, explain it in a few words.
- **Keep it short on screen.** Short messages. No long lists, tables or code in chat unless asked. Don't paste file contents back; say where the file is.
- **One question at a time.** Wait for the answer. If an answer is thin, ask one follow-up at most, then move on. "Skip", "later" and "I don't know" are fine answers.
- **Match them.** Use their spelling (UK or US) and their tone once you know it.
- **Never ask for passwords or keys in the chat.** Logins happen in their own browser.
- **Ask first** before anything public, paid, sent to someone else, or hard to undo. Putting the website live counts: get a clear yes.
- **Mac: don't use `git`, `python3` or Homebrew.** On a new Mac, `git` and `python3` pop up a "developer tools" installer that takes ages. You don't need them today. Use `curl`, `tar`, `open` and the other built-in commands.
- **Work only in this folder** (the one the app was opened in). Tools you download go in `.tools/` inside it.
- **Write files with your file tool**, one file at a time, not with long shell commands, so each file shows clearly on screen. Keep shell commands short.
- Keep this guide in the folder as `SETUP.md` (download it there if you haven't), so you can come back to it.
- If something fails, say what happened in a sentence, try the obvious fix once, and if it still fails, tell them plainly what to do.

## Step 0: say hello and get the go-ahead

Say, in three or four short sentences: you'll set up their AI OS in this folder; first a short interview (about 8 questions, they can type or talk: on a Mac, press the dictation key or Fn twice; on Windows, Windows key + H); then their context folder, a Cloudflare login for hosting, and a website skill; then you'll build a website together and put it live. Ask them to say "go".

Then check the basics without fuss (don't narrate each check): the folder is writable; whether `node --version` works (note it for Step 3); whether Google Chrome is installed (`ls "/Applications/Google Chrome.app"` on a Mac); which system it is (`uname -s -m`, or Windows). Fix nothing yet.

## Step 1: Context, the interview

Say: "First, context: I'll ask you about 8 questions so I know who you are. If you've got a bio, CV or About page, paste it in and I'll skip what it already answers."

Ask these one at a time, in your own words, warmly and briefly:

1. What should I call you, and where are you based?
2. What do you do? Describe a normal week as you'd tell a friend.
3. What's on your plate right now? Work, side projects, anything. One line each.
4. Which of those would make the biggest difference if it moved forward this month?
5. Where do you want to be a year from now?
6. How do you like to be spoken to: short and to the point, or more detailed? Anything about AI replies that annoys you?
7. What should I never do without asking you first?
8. What apps and tools do you use every day?

Close with: "Anything else I should know?" Keep the whole interview under ten minutes. Tell them they can add more any time by saying "interview me about my goals" (or anything else).

## Step 2: Context, build the folders

Say what you're doing: turning their answers into a folder of plain text files that you read at the start of every conversation, so you never start from zero.

Create this in the current folder. Every project they named in question 3 gets its own folder and a line in `context/projects/README.md`; don't invent others.

```
CLAUDE.md                    how to work with them; read every session
context/                     what you know about them
  me/
    about.md                 who they are, what they do, a normal week, tools they use
    goals.md                 in a year; this month
    preferences.md           how to talk to them, what annoys them, what needs asking first
  projects/
    README.md                one line per project
    <project-name>/README.md one per project: what it is, where it's at, next step
  people/README.md           people who matter, one line each (only what they mentioned)
  journal/<today>.md         a short note of today's session
access/README.md             one line per tool: what for, cost, how connected, how to switch off; never keys
skills/                      how they like things done
.claude/skills               a hidden shortcut to skills/ (see below), so Claude finds skills by itself
automation/README.md         things that run on their own (empty for now; say so in the file)
```

The four top-level folders are the four layers, so anyone opening the folder sees Context, Access, Skills, Automation. Keep it that way: everything new goes inside one of them, and only `CLAUDE.md` and `SETUP.md` (plus the hidden `.tools/` and `.claude/`) sit beside them.

Then make the hidden shortcut, so the Claude app finds skills on its own (it lists each skill's one-line description at the start of a session and opens the full skill only when it's needed). On a Mac: `mkdir -p .claude && ln -s ../skills .claude/skills`. On Windows: `cmd //c "mklink /J .claude\\skills skills"` after `mkdir -p .claude`; if that fails too, skip it: `CLAUDE.md` tells Claude where the skills are. Don't narrate this beyond one line.

Write `CLAUDE.md` from this template, filled in from the interview. Replace the lines in brackets with the real thing. Keep the `@` lines exactly as they are: they make those four files load every session. Keep this file to this length: the detail goes in the `context/` files.

```markdown
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
```

Use their own words where you can; don't pad. Then show the folder as a short tree (the four layer folders at the top), open `context/me/about.md` for them (`open context/me/about.md` on a Mac, `start` on Windows), and say: "That's your context layer. You can edit these files yourself, or just tell me, for example 'update my goals'."

## Step 3: Access, connect Cloudflare

Say: "Next, access: which doors I'm allowed to open. Today we need one: Cloudflare, a free service that will host your website. You'll log in in your browser; you never paste a password or key here." Ask if they have a free Cloudflare account; if not, they can sign up on the login page in a moment (free, no card).

**3a. Node.** Cloudflare's tool (Wrangler) needs Node, a free program that runs it. If `node --version` worked in Step 0 and shows v20 or newer, use it. Otherwise:

- **Mac** (no password needed, nothing installed system-wide): say "I'm downloading Node into a hidden tools folder here; about a minute." Then run, as one command:
  ```
  mkdir -p .tools && cd .tools && A=$(uname -m | sed s/x86_64/x64/) && F=$(curl -fsSL https://nodejs.org/dist/latest-v24.x/SHASUMS256.txt | grep "darwin-$A.tar.gz" | awk '{print $2}') && curl -fsSLO "https://nodejs.org/dist/latest-v24.x/$F" && tar xzf "$F" && rm "$F" && mv node-v*-darwin-$A node && cd .. && .tools/node/bin/node --version
  ```
  From now on, start every command that uses Node or npx with `export PATH="$PWD/.tools/node/bin:$PATH" &&` (run from this folder).
- **Windows**: run `winget install -e --id OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements`, tell them to click Yes if Windows asks, then ask them to close and reopen the Claude app in this folder and say "carry on".

**3b. Log in.** Use exactly `wrangler@4.153.0` (tested with this guide). Check first: `npx --yes wrangler@4.153.0 whoami`. If it shows they're logged in, skip ahead. Otherwise say: "A browser window will open. Log in to Cloudflare, or sign up, then click Allow. Come back here when it says you're done." Then run `npx --yes wrangler@4.153.0 login` with a 5-minute time limit and wait (it finishes by itself once they click Allow; the page lists a lot of permissions, which is normal for Cloudflare's own tool). Confirm with `npx --yes wrangler@4.153.0 whoami` and tell them which account it's connected to (the email it shows).

**3c. Write it down.** Add one line to `access/README.md`: Cloudflare, for hosting websites, free plan, connected by browser login, switch off with `npx wrangler logout`; details in `access/cloudflare.md`. Then write `access/cloudflare.md`: the account it's logged in as (if Wrangler showed it), how it's connected (browser login with Wrangler), how to run Node and Wrangler from this folder (the PATH line above, if you used `.tools`), and how to switch it off (`npx wrangler logout`, or the Cloudflare dashboard under My Profile → API Tokens). Say: "That's your access layer: one door open, and no keys in this chat."

## Step 4: Skills, the website skill

Say: "A skill is your way of doing something, written down, so I do it like that every time. Here's one for building websites."

Create `skills/build-website/SKILL.md` with exactly this content:

<!-- skill:build-website:start -->
```markdown
---
name: build-website
description: Build a website by talking, then put it live on Cloudflare Pages. Use whenever I ask for a website, landing page or web page, or a change to one.
---

# Build a website

How I like websites built. Follow these steps every time.

## 1. Get the brief (questions first)
- Read `context/me/about.md` and the project's README first, so you don't ask what you already know.
- Ask one question at a time until you can describe the site in three lines: who it's for, what it should make them do, what goes on it. Usually three to five questions: what it's for, who visits, the one thing a visitor should do (call, book, buy, sign up), what must be on it (prices, opening hours, contact), and any words or photos I already have.
- Ask for photos: if I have any, I can drag them into the chat or tell you where they are (my Desktop or Downloads, say); copy the ones you use into `site/images/`, made smaller for phones (on a Mac: `sips -Z 1400 -s format jpeg <photo> --out site/images/<name>.jpg`, which also turns iPhone HEIC photos into JPEGs). Check I'm allowed to use any photo that isn't mine. Real photos make the biggest difference.
- Then say the brief back in three lines and wait for my OK.

## 2. Build it
- One folder per site: `context/projects/<site-name>/site/`, with `index.html` and `styles.css`. Plain HTML and CSS, no frameworks and no build step, so it opens straight in a browser.
- Mobile-first: design for a phone first, then make it work wide. Most visitors arrive on a phone.
- Real words. Write proper copy from what I told you; no "Lorem ipsum", and never invent facts (prices, reviews, awards, phone numbers). If something is missing, leave a clearly marked gap and tell me.
- Don't make it look AI-made. Avoid purple-to-blue gradients, glowing blobs, emoji in headings, "Elevate your…" or "Unlock…" copy, three identical feature cards, and stock phrases. Pick one strong colour that suits the business, one or two good fonts, plenty of space, and a clear button for the one thing visitors should do.
- Accessible: real text (not text in images), good contrast, alt text, tap targets at least 44px.

## 3. Check it before showing me
- Open it in my browser so I can see it: `open context/projects/<site-name>/site/index.html` (Windows: `start`).
- Check it at phone width yourself before you show me. On a Mac with Google Chrome, run this from the AI OS folder (it frames the page at 390px, the width of a phone, takes a screenshot, and stops after 10 seconds), then look at `/tmp/phone.png`:
  `S="$PWD/context/projects/<site-name>/site/index.html"; printf '<body style="margin:0"><iframe src="file://%s" style="width:390px;height:2400px;border:0"></iframe>' "$S" > /tmp/phone.html; rm -f /tmp/phone.png; "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --hide-scrollbars --window-size=600,2400 --screenshot=/tmp/phone.png file:///tmp/phone.html >/dev/null 2>&1 & sleep 10; kill $! 2>/dev/null; ls /tmp/phone.png`
  (Don't set Chrome's window to 390 wide instead: on a Mac it won't go that narrow and the screenshot comes out cut off.) No Chrome, or on Windows: open the page in the app's browser pane, make it narrow, and look. Fix anything cramped, cut off or sideways-scrolling.
- Tell me in one or two lines what you made and what to look at.

## 4. Changes
- I'll just say what I want changed. Make the change, run the phone check again (every time), reopen it for me, and tell me in a line what changed.

## 5. Put it live (only when I say yes)
- Ask first, every time: "Shall I put it live? It will be public at <site-name>.pages.dev." Wait for a clear yes.
- Only the `site` folder goes live, never the rest of this folder (my context files are private). Check `context/projects/<site-name>/site/` holds only website files first.
- Use exactly this Wrangler version, with Node on the path as set up in `access/cloudflare.md`. The first time, create the project on Cloudflare Pages (`--force` keeps it on Pages, so it gets a free `.pages.dev` address with no extra set-up; only use it on this create command):
  `npx --yes wrangler@4.153.0 pages project create <site-name> --production-branch main --force`
- Then deploy (this and every later update):
  `npx --yes wrangler@4.153.0 pages deploy context/projects/<site-name>/site --project-name <site-name> --branch main --commit-dirty=true`
- Give me the main address, `https://<site-name>.pages.dev` (if the create command printed a slightly different one, use that), not the long one-off link with random letters at the front. A brand-new address can take a minute or two to start working: check it loads with `curl -sI` before you say it's live.
- Note the live address in the project's README.

## My taste
(Add what I like and don't like here as we go: sites I like, colours, fonts, things to avoid.)
```
<!-- skill:build-website:end -->

Then ask one question to make it theirs: "Is there a website you like the look of, or a style you can't stand?" Add the answer under "My taste" in the skill. Say: "That's your skills layer. Any time you do something you'll want again, I'll offer to save it as a skill like this one."

## Step 5: Build the website by talking

Ask: "What website shall we build? It could be for your business, a project, or just for fun." Then follow `skills/build-website/SKILL.md` exactly: questions first, the brief back, build, open it for them, check it at phone size, take their changes. Use a short, lowercase site name with hyphens (for example `marias-bakery`); it becomes the web address. Put the site in that project's folder (rename an existing project folder to match if it's the same project), with a README, and keep its line in `context/projects/README.md` up to date.

When they're happy, ask before going live (the skill says how), deploy only on a clear yes, check the address loads, and give them the link to open on their phone.

## Step 6: Finish

Write today's note in `context/journal/` (what was set up, the live address). Then give a short summary, about six lines:
- **Context**: the `context` folder (you, your projects, your people) and `CLAUDE.md`; I read them every time.
- **Access**: Cloudflare, by browser login, no keys.
- **Skills**: `build-website`, with your taste in it.
- **Your website**: the live link.
- **Automation**: the `automation` folder is there, empty for now.
- **Next**: "Turn this website into an app" is the next step. The fourth layer, automation (things that run on their own), plus more tools, agents and using it from your phone, come later.

End with two or three things they could try tomorrow, drawn from their answers (for example "ask me to draft this week's offer for the site"). Keep it short.
