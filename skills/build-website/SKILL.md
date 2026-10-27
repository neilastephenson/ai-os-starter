---
name: build-website
description: Build a website by talking, then put it live on Cloudflare Pages. Use whenever I ask for a website, landing page or web page, or a change to one.
---

# Build a website

How I like websites built. Follow these steps every time.

## 1. Get the brief (questions first)
- Read `context/me/about.md` and the project's README first, so you don't ask what you already know.
- Ask one question at a time until you can describe the site in three lines: who it's for, what it should make them do, what goes on it. Usually three to five questions: what it's for, who visits, the one thing a visitor should do (call, book, buy, sign up), what must be on it (prices, opening hours, contact), and any words or photos I already have.
- Ask for photos: if I have any, I can drag them into the `context/inbox/` folder; copy the ones you use into `site/images/`, made smaller for phones (on a Mac: `sips -Z 1400 -s format jpeg <photo> --out site/images/<name>.jpg`, which also turns iPhone HEIC photos into JPEGs). Check I'm allowed to use any photo that isn't mine. Real photos make the biggest difference.
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
- Use exactly this Wrangler version, with Node on the path as set up in `access/README.md`. The first time, create the project on Cloudflare Pages (`--force` keeps it on Pages, so it gets a free `.pages.dev` address with no extra set-up; only use it on this create command):
  `npx --yes wrangler@4.153.0 pages project create <site-name> --production-branch main --force`
- Then deploy (this and every later update):
  `npx --yes wrangler@4.153.0 pages deploy context/projects/<site-name>/site --project-name <site-name> --branch main --commit-dirty=true`
- Give me the main address, `https://<site-name>.pages.dev` (if the create command printed a slightly different one, use that), not the long one-off link with random letters at the front. A brand-new address can take a minute or two to start working: check it loads with `curl -sI` before you say it's live.
- Note the live address in the project's README.

## My taste
(Add what I like and don't like here as we go: sites I like, colours, fonts, things to avoid.)
