#!/usr/bin/env bash

if [[ "$RUNNER_OS" == Windows ]]; then
    $GITHUB_ACTION_PATH/executables/windows/app.exe $CONFIG_FILE_PATH
elif [[ "$RUNNER_OS" == Linux ]]; then
    $GITHUB_ACTION_PATH/executables/linux/app.exe $CONFIG_FILE_PATH
elif [[ "$RUNNER_OS" == macOS ]]; then
    $GITHUB_ACTION_PATH/executables/macos/app.exe $CONFIG_FILE_PATH
else
    echo "Unsupported OS: $RUNNER_OS";
    exit 1;
fi
