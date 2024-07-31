#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" && pwd )
bash "${SCRIPT_DIR}/packages/install_packages.sh"
bash "${SCRIPT_DIR}/fonts/install_fonts.sh"
bash "${SCRIPT_DIR}/applications/install_applications.sh"
bash "${SCRIPT_DIR}/service_manager/enable_services.sh"
bash "${SCRIPT_DIR}/misc/setup_misc.sh"
bash "${SCRIPT_DIR}/developer/install.sh"
bash "${SCRIPT_DIR}/linking/link_config.sh"

