#!/usr/bin/env bash

set -euo pipefail

# Check for exactly 3 arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <ProjectName> <ParentName> <ChildName>"
    echo "Example: $0 MyProject Server Client"
    exit 1
fi

PROJECT_NAME="$1"
PARENT_NAME="$2"
CHILD_NAME="$3"

# Path to template directory
TEMPLATE_DIR="${HOME}/dots/extra/project-templates/cpp/prj-layout-2"

if [ ! -d "${TEMPLATE_DIR}" ]; then
    echo "Error: Template directory '${TEMPLATE_DIR}' does not exist."
    exit 1
fi

TARGET_DIR="./${PROJECT_NAME}"

if [ -d "${TARGET_DIR}" ]; then
    echo "Error: Target directory '${TARGET_DIR}' already exists."
    exit 1
fi

echo "Creating project in ${TARGET_DIR}..."
cp -r "${TEMPLATE_DIR}" "${TARGET_DIR}"
cd "${TARGET_DIR}"

# 1. Update project name inside the root CMakeLists.txt
if [ -f "CMakeLists.txt" ]; then
    # Replaces 'prj-layout-2' or 'project(...)' declarations with the new project name
    sed -i "s/prj-layout-2/${PROJECT_NAME}/g" CMakeLists.txt
fi

# 2. Rename files and directories matching 'Parent' and 'Children'
find . -depth \( -name "*Parent*" -o -name "*Children*" \) | while read -r path; do
    dir=$(dirname "${path}")
    base=$(basename "${path}")
    
    new_base=$(echo "${base}" | sed "s/Parent/${PARENT_NAME}/g; s/Children/${CHILD_NAME}/g")
    
    if [ "${base}" != "${new_base}" ]; then
        mv "${path}" "${dir}/${new_base}"
    fi
done

# 3. Replace internal file contents for Parent and Children
find . -type f | while read -r file; do
    if file "${file}" | grep -q "text"; then
        sed -i "s/Parent/${PARENT_NAME}/g; s/Children/${CHILD_NAME}/g" "${file}"
    fi
done

echo "Project '${PROJECT_NAME}' initialized successfully at ${TARGET_DIR}!"
