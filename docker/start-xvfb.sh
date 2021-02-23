#!/usr/bin/env bash

export GEOMETRY="${SCREEN_WIDTH}""x""${SCREEN_HEIGHT}""x""${SCREEN_DEPTH}"

rm -f /tmp/.X*lock

# Command reference
# http://manpages.ubuntu.com/manpages/focal/man1/xvfb-run.1.html
# http://manpages.ubuntu.com/manpages/focal/man1/Xvfb.1.html
# http://manpages.ubuntu.com/manpages/focal/man1/Xserver.1.html
/usr/bin/xvfb