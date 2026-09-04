#!/usr/bin/env bash
# Regenerates the Open Graph / link-preview card for nunchimangchi.com.
#
# Design (banner sibling): 1200x627 (LinkedIn Featured-widget preferred ratio), deep-ink ground, bronze I Ching
# Hexagram 1 (The Creative, six unbroken lines), a libre book serif for
# the line, a tracked grotesk for the domain. Rendered at 3x and
# downsampled for crisp edges.
#
# Reproducible anywhere: fonts are committed alongside this script
# (SIL OFL 1.1, see fonts/OFL-*.txt). Needs ImageMagick 7 (`magick`).
# No Python, no system fonts.
#
# Output: og.png + og.jpg at the repo root.
set -euo pipefail
cd "$(dirname "$0")"

S=3
W=$((1200 * S)); H=$((627 * S))
SERIF="fonts/SourceSerif4-VF.ttf"       # ~= New York: contemporary book serif
SANS="fonts/SpaceGrotesk-VF.ttf"        # matches the career-ops brand sans

INK="#0F1319"; BRONZE="#A88C5A"; BONE="#F2EDE3"

# Hexagram 1: six solid bronze bars, centred.
bw=$((150 * S)); bh=$((12 * S)); gap=$((18 * S)); top=$((158 * S))
cx=$((W / 2)); x0=$((cx - bw / 2)); x1=$((cx + bw / 2))
bars=()
for i in 0 1 2 3 4 5; do
  y=$((top + i * (bh + gap)))
  bars+=(-draw "rectangle $x0,$y $x1,$((y + bh))")
done

magick -size "${W}x${H}" "xc:${INK}" \
  -fill "${BRONZE}" "${bars[@]}" \
  -gravity north \
  -font "${SERIF}" -pointsize $((50 * S)) -fill "${BONE}" \
  -annotate "+0+$((330 * S))" "Building real, working" \
  -annotate "+0+$((394 * S))" "software, in the open." \
  -font "${SANS}" -pointsize $((18 * S)) -fill "${BRONZE}" -kerning $((4 * S)) \
  -annotate "+0+$((500 * S))" "NUNCHIMANGCHI.COM" \
  -resize "1200x627" \
  -background "${INK}" -alpha remove -alpha off -depth 8 -strip \
  -define png:color-type=2 \
  og-v2.png

magick og-v2.png -quality 92 -strip og-v2.jpg

# Move the rendered cards to the repo root, where the site serves them.
mv -f og-v2.png og-v2.jpg ../../
echo "wrote og-v2.png + og-v2.jpg to repo root"
