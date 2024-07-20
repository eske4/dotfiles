#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" && pwd )

bash "${SCRIPT_DIR}/services/mpd_service.sh"
bash "${SCRIPT_DIR}/services/audio_service.sh"

