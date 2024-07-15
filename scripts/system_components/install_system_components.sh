#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" && pwd )

bash "${SCRIPT_DIR}/components/hypridle.sh" 
bash "${SCRIPT_DIR}/components/hyprlock.sh" 
bash "${SCRIPT_DIR}/components/eww.sh" 
