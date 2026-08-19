# Design Pass 2 Notes: Visual & Interaction Refinements
**Branch:** `feat/design-pass-2`  
**Author:** Gemini CLI  
**Date:** August 19, 2026  

---

## Important Validation Disclaimer
> **Note on Visual Verification:** As an AI agent executing in a headless CLI environment, I do not have access to a web browser, viewport rendering, or virtual screen capture for live-visual verification. I have relied entirely on systematic manual CSS engineering, precise mathematical scaling, semantic box-modeling, and strict compliance with modern visual design conventions to ensure visual stability and correct behavior.

---

## 1. Typography & Hierarchy
*   **Font-Smoothing:** Injected `-webkit-font-smoothing: antialiased` and `-moz-osx-font-smoothing: grayscale` to the `body` declaration to guarantee razor-sharp rendering of system fonts on macOS, iOS, and high-DPI Windows/Linux screens.
*   **Scale Enhancements:** 
    *   Slightly narrowed the `.wrap` container from `760px` to `720px` to maintain the **typographically optimal line-length** (~65 characters per line). This minimizes horizontal scanning fatigue and yields an immediate editorial feeling.
    *   Increased the `h1` size to `2.2rem` (font-weight `800`) with tighter `line-height: 1.2` and negative tracking (`letter-spacing: -0.025em`) to anchor the page with a solid, authoritative technical header.
    *   Set `.project-head h2` to `1.35rem` with `letter-spacing: -0.015em` to make card headings stand out cleanly.
*   **Subtle Metadata Polish:** Re-engineered the `.project-tag` to use `font-size: 0.72rem`, `font-weight: 600`, and a broader tracking scale (`letter-spacing: 0.08em`) to make the technical tags feel secondary, structured, and modern.

---

## 2. Visual Rhythm & Spacing
*   **Structured Breathing Room:** Transitioned the general `.projects` vertical flex gap from a basic `18px` to an intentional `24px`, letting cards sit as distinct elements of a unified system.
*   **Card Proportions:** Increased card padding to `28px 32px` to give the detailed content comfortable inner margins and balance the typographical weight.
*   **Unified Breakout Styling:** Upgraded the `.ai-section` to match the exact `12px` border-radius and border styles of the project cards. Added an elegant `::before` vertical accent bar (colored with `--accent` at `65%` opacity) anchored on the left side of the block, framing the section as an intentional, high-signal breakout.

---

## 3. The `.field-label` Pattern Refinement
*   **Typographic Signposting:** Rather than plain inline bolding, `.field-label` was redesigned as a crisp, uppercase, high-contrast label:
    ```css
    .field-label {
      color: var(--accent);
      font-weight: 700;
      font-size: 0.76rem;
      text-transform: uppercase;
      letter-spacing: 0.05em;
      display: inline-block;
      margin-right: 4px;
    }
    ```
*   **Rationale:** Changing these into small uppercase labels styled with your primary theme accent color instantly transforms them into **functional typographic signposts**. When a recruiter is scanning the page, these labels jump out in the reading flow, allowing them to instantly locate *"What it does,"* *"The real decision,"* and *"Current state"* across all projects in milliseconds.

---

## 4. Hover & Interaction States
*   **Card Translation & Borders:** Project cards now transition dynamically on hover/focus: rising by `-2px` on the Y-axis, transitioning the border color to `--accent-alpha` (a soft custom translucency), and casting a deeper, softer box shadow (`--shadow-md`).
*   **Micro-Interaction Hooks:** Wrapped the raw HTML `&rarr;` symbol in `index.html` inside `<span class="arrow">` tags. In the stylesheet, we hooked this arrow to trigger on **either card hover or direct link hover**:
    ```css
    .project-card:hover .project-link .arrow,
    .project-link:hover .arrow {
      transform: translateX(3px);
    }
    ```
    This creates an extremely satisfying, premium, and alive micro-interaction that signals clickability.
*   **Focus-Visible Rings:** Set up robust dashed outline focus indicators for keyboard-only accessibility (`a:focus-visible` and `.project-card:focus-within`) with clean offsets to comply with modern accessibility standards (WCAG) while remaining aesthetically pleasing.

---

## 5. Mobile Responsiveness (`@media (max-width: 560px)`)
*   **Typographical Scaling:** Scaled the default `body` font size down to `15px` and reduced the `h1` to `1.65rem` with a tight `margin-bottom` to optimize real estate on mobile screens.
*   **Layout Re-alignment:** 
    *   Transitioned the `.project-head` block from horizontal baseline flex to `flex-direction: column; align-items: flex-start; gap: 6px;`.
    *   *Rationale:* On narrow viewports, the project title `h2` and the `View on GitHub` links often compete horizontally, causing messy word-wrapping or off-screen bleeding. Forcing them into a clean vertical stack on mobile looks incredibly polished and natural.
    *   Slightly reduced card padding to `22px 20px` to maximize reading width.

---

## 6. Dark / Light Mode Balance
*   **Warm Sand Light Mode:** Made the light mode page background a warm, low-contrast sand cream (`#f8f8f6`) paired with solid `#ffffff` card surfaces. Substituted harsh solid black text for a soft primary ink black (`#111214`) and rich charcoal secondary text (`#4a4d52`) to ensure comfortable reading under high ambient light.
*   **Obsidian Dark Mode:** Redesigned the dark mode from a flat charcoal grey to a rich, deep obsidian slate background (`#08090b`) with slightly lighter `#111318` card surfaces. 
*   **Color-Safe Accents:** Used an editorial deep indigo-blue (`#1e40af`) for light mode, and shifted to a vibrant, highly accessible indigo-violet (`#6366f1`) for dark mode, ensuring both themes look customized and highly intentional rather than programmatically inverted.
