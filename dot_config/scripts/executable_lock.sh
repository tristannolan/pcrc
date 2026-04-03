#!/bin/sh

# Catppuccin Mocha colors (Mauve accent)
clr_bg='#1e1e2e'          # base
clr_clear='#1e1e2e00'     # base with full transparency
clr_text='#cdd6f4'        # text
clr_subtext='#bac2de'     # subtext1
clr_overlay='#6c7086'     # overlay0
clr_mauve='#cba6f7'       # accent
clr_red='#f38ba8'         # red
clr_green='#a6e3a1'       # green
clr_peach='#fab387'       # peach

i3lock \
    --insidever-color=$clr_subtext \
    --ringver-color=$clr_mauve \
    \
    --insidewrong-color=$clr_subtext \
    --ringwrong-color=$clr_red \
    \
    --inside-color=$clr_bg \
    --ring-color=$clr_overlay \
    --line-color=$clr_bg \
    --separator-color=$clr_overlay \
    \
    --verif-color=$clr_text \
    --wrong-color=$clr_red \
    --time-color=$clr_text \
    --date-color=$clr_subtext \
    --layout-color=$clr_subtext \
    --keyhl-color=$clr_mauve \
    --bshl-color=$clr_red \
    \
    --screen 1 \
    --blur 19 \
    --clock \
    --indicator \
    --time-str="%H:%M:%S" \
    --date-str="%A, %Y-%m-%d" \
    --keylayout 1
