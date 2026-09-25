#!/usr/bin/env bash

set -euo pipefail

usage() {
    echo "Usage:"
    echo "  $0 <ProjectName>                             (Single Project)"
    echo "  $0 <ProjectName> <ParentName> <ChildName>    (Parent/Child Layout)"
    echo ""
    echo "Examples:"
    echo "  $0 MyGame"
    echo "  $0 simple-tcp-cpp sTCP App"
    exit 1
}

# 1. Parse arguments and determine layout
if [ "$#" -eq 1 ]; then
    LAYOUT=1
    PROJECT_NAME="$1"
elif [ "$#" -eq 3 ]; then
    LAYOUT=2
    PROJECT_NAME="$1"
    PARENT_NAME="$2"
    CHILD_NAME="$3"
else
    usage
fi

# 2. Define paths
TEMPLATES_BASE="${HOME}/dots/extra/project-templates/cpp"
TEMPLATE_DIR="${TEMPLATES_BASE}/prj-layout-${LAYOUT}"
TARGET_DIR="./${PROJECT_NAME}"

# 3. Pre-flight checks
if [ ! -d "${TEMPLATE_DIR}" ]; then
    echo "Error: Template directory '${TEMPLATE_DIR}' does not exist."
    exit 1
fi

if [ -d "${TARGET_DIR}" ]; then
    echo "Error: Target directory '${TARGET_DIR}' already exists."
    exit 1
fi

echo "Creating project '${PROJECT_NAME}' (Layout ${LAYOUT}) in ${TARGET_DIR}..."
cp -r "${TEMPLATE_DIR}" "${TARGET_DIR}"
cd "${TARGET_DIR}"

# 4. Prepare dynamic substitution script
SED_SCRIPT="s/Project/${PROJECT_NAME}/g"

if [ "$LAYOUT" -eq 2 ]; then
    SED_SCRIPT+="; s/Parent/${PARENT_NAME}/g; s/Children/${CHILD_NAME}/g"
fi

# 5. Rename files and directories (deepest-first to preserve valid paths)
find . -depth | while read -r path; do
    if [ "$path" = "." ]; then
        continue
    fi
    
    dir=$(dirname "${path}")
    base=$(basename "${path}")
    
    # Apply substitutions to the filename
    new_base=$(echo "${base}" | sed "${SED_SCRIPT}")
    
    if [ "${base}" != "${new_base}" ]; then
        mv "${path}" "${dir}/${new_base}"
    fi
done

# 6. Replace internal file contents for text files only
find . -type f | while read -r file; do
    if file "${file}" | grep -q "text"; then
        sed -i "${SED_SCRIPT}" "${file}"
    fi
done

echo "Project '${PROJECT_NAME}' initialized successfully at ${TARGET_DIR}!"
