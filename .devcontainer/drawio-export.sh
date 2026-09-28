#!/usr/bin/env bash
# Headless draw.io (diagrams.net) export.
#
# Wraps the drawio-desktop Electron binary with a virtual display and the
# container-safe Chromium flags, so diagrams can be exported without a
# desktop session. Arguments are passed straight through to drawio's export
# mode (-x is already applied).
#
#   drawio-export -f svg -o out.svg diagram.drawio
#   drawio-export -f png -s 2 -o out.png diagram.drawio
#   drawio-export -f pdf --crop -o out.pdf diagram.drawio
#
# Input may be .drawio/.dio/.xml or a .drawio.png / .drawio.svg carrying
# embedded diagram XML.
set -uo pipefail

if [[ $# -eq 0 ]]; then
  echo "usage: drawio-export -f <svg|png|pdf|jpg|vsdx|xml> -o <output> <input>" >&2
  echo "       (all flags are passed through to drawio --export)" >&2
  exit 2
fi

# Electron chatters about dbus/GPU/accessibility buses that do not exist in a
# container; drop those lines but keep everything else on stderr.
NOISE='ERROR:dbus|ERROR:object_proxy|Failed to connect to the bus|Failed to call method|ERROR:viz_main_impl|ERROR:gpu_|libva error'

xvfb-run -a drawio \
  --no-sandbox \
  --disable-gpu \
  --disable-dev-shm-usage \
  -x "$@" 2>&1 | grep -v -E "${NOISE}"

exit "${PIPESTATUS[0]}"
