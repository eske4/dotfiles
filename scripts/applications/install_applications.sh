#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" && pwd )

bash "${SCRIPT_DIR}/modules/steam.sh"
bash "${SCRIPT_DIR}/modules/better_discord.sh"
