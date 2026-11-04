# AI OS starter

A free starter kit for setting up your own AI operating system with Claude, then making a first real thing with it. It goes with Neil Stephenson's build-your-own AI OS series. It gets you to a working starting point; from there you can take it anywhere.

By the end your folder has one top-level folder per layer (`context`, `access`, `skills`, `automation`) and you'll have:

1. **Context**: a `context` folder of plain text files about you, built from a short interview.
2. **A first thing made**: Claude suggests three from your answers and you pick. In the video it's a website, built by talking and live at a free `something.pages.dev` address.
3. **Access**: whatever that first thing needs, connected without pasting keys into the chat (for a website, Cloudflare by browser login).
4. **Skills**: a skill for it, so it's done your way every time.

After that, `CLAUDE.md` tells Claude how to keep growing it: new tools go in `access/`, things you'll want again become skills, new projects get a folder.

## What you need

- A Mac or Windows computer.
- Claude Pro (about £18 / $20 a month) and the Claude desktop app.
- For a website: a free Cloudflare account (you can make it during setup; no card needed).
- About 45 minutes.

You don't need to install anything else first. Claude downloads what it needs (for a website, Node, for the Cloudflare tool) and tells you as it goes. On Windows, if the Claude app says Git is required, install Git for Windows from git-scm.com first.

## How to start

1. Make a new folder, for example `AI OS`.
2. Open the Claude desktop app, click **Code**, and choose that folder.
3. Paste this in and press Enter:

```
Set up my AI OS in this folder. Use curl to download the setup guide into this folder, then follow it exactly:
https://raw.githubusercontent.com/neilastephenson/ai-os-starter/main/SETUP.md
If you can't get it: interview me one question at a time, build my context folder from my answers, suggest three first things to make (one a website), then connect only what that needs (never ask me for keys), write a skill for it and make it with me, asking before anything goes public.
```

Claude asks before it runs a command or writes a file. Read what it wants to do and click to allow it; "don't ask again" is fine for the ones you're happy with. To stop it asking before every file it writes, set the mode under the message box to **Accept edits**.

## What's in here

- `SETUP.md`: the instructions Claude follows. Read it to see exactly what it will do.
- `template/`: the starting shape of your AI OS folder: `context/`, `access/`, `skills/` and `automation/`, one folder per layer.
- `skills/build-website/SKILL.md`: the website skill.

## After setup

- Add more about yourself any time: "interview me about my goals", or drag a document into the chat and ask Claude to file what matters.
- Change how anything works by saying so, or by editing the files. They're yours.
- Next: turning the website into an app, then automation (things that run on their own). See Neil's channel.

## Safety

Claude asks before anything public, paid or hard to undo, and never asks for passwords or keys in the chat. To disconnect Cloudflare, run `npx wrangler logout` or remove Wrangler under My Profile → API Tokens in the Cloudflare dashboard.
