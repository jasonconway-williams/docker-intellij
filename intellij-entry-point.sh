#!/bin/bash

if [ ! -d "$SDKMAN_DIR" ]; then
  curl -s get.sdkman.io | bash
fi

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh" && exec "$@"

/opt/idea-IC-163.12024.16/bin/idea.sh
