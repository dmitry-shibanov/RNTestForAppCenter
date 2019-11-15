#!/bin/sh

WORKSPACE_DIRECTORY="$1"
WORKSPACE_NAME="$2"

WORKSPACE="$WORKSPACE_DIRECTORY/$WORKSPACE_NAME.xcworkspace"
git ls-files --error-unmatch $WORKSPACE > /dev/null 2>&1
UNMANAGED_WORKSPACE=$?

if [ -d $WORKSPACE ] && [ $UNMANAGED_WORKSPACE != 0 ]; then
    echo "Detected auto-generated workspace: ${WORKSPACE}. It will be used for the build"
    echo '##vso[task.setvariable variable=APPCENTER_XCODE_PROJECT]'$WORKSPACE
    echo '##vso[task.setvariable variable=APPCENTER_XCODE_WORKSPACE]'$WORKSPACE
else
    echo "'${APPCENTER_XCODE_PROJECT}' will be used for the build"
fi
