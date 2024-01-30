#!/usr/bin/env bash

if [[ "$RUNNER_OS" == Windows ]]; then
    executables/windows/app.exe $CONFIG_FILE_PATH
elif [[ "$RUNNER_OS" == Linux ]]; then
    executables/linux/app.exe $CONFIG_FILE_PATH
elif [[ "$RUNNER_OS" == macOS ]]; then
    executables/macos/app.exe $CONFIG_FILE_PATH
else
    echo "Unsupported OS: $RUNNER_OS";
    exit 1;
fi
