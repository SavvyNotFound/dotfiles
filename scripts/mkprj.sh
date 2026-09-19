#!/usr/bin/env bash

set -euo pipefail

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define language-to-script mappings
declare -A PLUGINS=(
    ["cpp"]="prj-template/mkprj-cpp.sh"
)

usage() {
    echo "Usage: $0 <language> <ProjectName> <ParentName> <ChildName>"
    echo "Available languages:"
    for lang in "${!PLUGINS[@]}"; do
        echo "  $lang -> ${PLUGINS[$lang]}"
    done
    exit 1
}

# Require at least 1 argument
if [ "$#" -lt 1 ]; then
    usage
fi

LANG_KEY="$1"
shift  # Pass remaining arguments to target script

# Check if language exists in array
if [[ -z "${PLUGINS[$LANG_KEY]+x}" ]]; then
    echo "Error: Unknown language '$LANG_KEY'"
    usage
fi

TARGET_SCRIPT_NAME="${PLUGINS[$LANG_KEY]}"
TARGET_SCRIPT_PATH="${SCRIPT_DIR}/${TARGET_SCRIPT_NAME}"

# Verify relative script exists and is executable
if [ ! -x "$TARGET_SCRIPT_PATH" ]; then
    echo "Error: Executable '$TARGET_SCRIPT_NAME' not found or not executable at '${TARGET_SCRIPT_PATH}'"
    exit 1
fi

# Execute relative script directly with remaining arguments
exec "$TARGET_SCRIPT_PATH" "$@"
