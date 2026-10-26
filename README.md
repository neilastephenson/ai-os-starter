# AI OS starter

A free starter kit for setting up your own AI operating system with Claude, then building a website by talking to it and putting it live. It goes with Neil Stephenson's video "set up your own AI OS".

By the end you'll have:

1. **Context**: a "brain" folder of plain text files about you, built from a short interview.
2. **Access**: Claude connected to Cloudflare (free website hosting) through a browser login. You never paste a key.
3. **Skills**: a website skill, so websites get built your way every time.
4. **A website**, built by talking, live at a free `something.pages.dev` address.

## What you need

- A Mac or Windows computer.
- Claude Pro (about £18 / $20 a month) and the Claude desktop app.
- A free Cloudflare account (you can make it during setup; no card needed).
- About 45 minutes.

You don't need to install anything else first. Claude downloads what it needs (Node, for the Cloudflare tool) and tells you as it goes. On Windows, if the Claude app says Git is required, install Git for Windows from git-scm.com first.

## How to start

1. Make a new folder, for example `AI OS`.
2. Open the Claude desktop app, click **Code**, and choose that folder.
3. Paste this in and press Enter:

```
Set up my AI OS in this folder. Use curl to download the setup guide into this folder, then follow it exactly:
https://raw.githubusercontent.com/neilastephenson/ai-os-starter/main/SETUP.md
If you can't get it: interview me one question at a time, build my brain folder from my answers, connect Cloudflare by browser login (never ask me for keys), add a website skill, then build me a website and put it live on Cloudflare Pages, asking before anything goes public.
```

Claude asks before it runs a command or writes a file. Read what it wants to do and click to allow it; "don't ask again" is fine for the ones you're happy with. To stop it asking before every file it writes, set the mode under the message box to **Accept edits**.

## What's in here

- `SETUP.md`: the instructions Claude follows. Read it to see exactly what it will do.
- `brain-template/`: the starting shape of your brain folder.
- `skills/build-website/SKILL.md`: the website skill.

## After setup

- Add more about yourself any time: "interview me about my goals", or drop a document in `inbox/` and ask Claude to file it.
- Change how anything works by saying so, or by editing the files. They're yours.
- Next: turning the website into an app, then automation (things that run on their own). See Neil's channel.

## Safety

Claude asks before anything public, paid or hard to undo, and never asks for passwords or keys in the chat. To disconnect Cloudflare, run `npx wrangler logout` or remove Wrangler under My Profile → API Tokens in the Cloudflare dashboard.
