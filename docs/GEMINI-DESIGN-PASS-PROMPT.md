# Gemini pass 2: actual design execution, not another advisory doc

Read this in full before touching anything. This is a different kind of
pass than your last one (`docs/GEMINI-TONE-REVIEW-PROMPT.md` /
`docs/GEMINI-TONE-REVIEW-FINDINGS.md`) — that one was research and advice;
this one is **hands-on visual execution**. You have permission to actually
edit `index.html` (structure/classes only, not the words) and `style.css`
directly this time.

## What happened with your last pass — read this so you don't repeat it

Your tone/wording recommendations were reviewed by a human and partially
rejected. Specifically rejected, and not up for reconsideration:

- Reframing the AI-collaboration section as "operating as Tech Lead and
  Systems Architect, delegating raw implementation to Claude Code (acting
  as an autonomous IC developer) under a rigorous governance framework."
  There is no team here — one person, one AI coding tool. That framing
  invents a management relationship that doesn't exist and would fall
  apart under any real interview question about it.
- The invented metric "100% environment parity across macOS and Linux
  endpoints" — never measured, fabricated to sound impressive.
- General buzzword-density rewrites ("asynchronous orchestration
  pipeline," "un-cooperative third-party endpoints") that describe simple
  things in inflated language — this reads as exactly the kind of AI-slop
  a technical reader clocks instantly, the opposite of the intended effect.

What *was* kept from your review: breaking each project card into
scannable "What it does / The real decision / Current state" fields, and
a more honest (not more inflated) version of the AI-collaboration section.
Both are already live in `index.html` — **content and copy are now
finalized. Do not propose or make any wording/content changes in this
pass.** If you think something's factually off, note it in your findings
file rather than changing it.

## What this pass is actually for

Design matters as much as the code, and first impressions happen once —
that's the standard to hold yourself to here, not a quick pass of color
tweaks. Take real time on this. Read `style.css` and `index.html` in full
first to understand the current system (CSS custom properties for
light/dark, card-based layout, `760px` max-width single column) before
changing anything.

Actually push on:
- **Typography and hierarchy** — is the current type scale doing enough
  work? Look at heading weight/size relationships, line-length,
  line-height, letter-spacing on labels.
- **Visual rhythm and spacing** — does the page have a considered spacing
  system, or does everything just use similar-looking gaps? Look hard at
  whether the three project cards feel like one designed system or three
  independent blocks.
- **The `.field-label` bold-label pattern** (What it does / The real
  decision / Current state) — it's functional but plain right now. Is
  there a better visual treatment — icon, color accent, small-caps,
  something — that makes the structure easier to scan without adding
  clutter?
- **Hover/interaction states** — the project links and cards currently
  have minimal hover treatment. Worth a real look.
- **Mobile** — actually think through the `@media (max-width: 560px)`
  breakpoint, don't just assume the desktop layout degrades gracefully.
- **Dark/light mode** — both need to look intentional, not like one was
  designed and the other just inverted.

No new dependencies, no new fonts/CDN links (this needs to stay a
self-contained static site), no new pages/routes. Plain CSS only.

## Process

1. `git checkout -b feat/design-pass-2`
2. Read `style.css` + `index.html` in full first.
3. Make real, considered changes — not a token pass.
4. You have no browser and cannot visually verify your own work — say so
   explicitly in your findings rather than claiming you saw it render.
5. Commit locally. **Do not push, do not open a PR** — human review
   happens against the live rendered page after, same as last time.
6. Write a short `docs/GEMINI-DESIGN-PASS-2-NOTES.md`: what you changed
   and why, organized by the categories above.

Don't be lazy about this one.
