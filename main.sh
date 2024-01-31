#!/usr/bin/env bash

if [[ "$RUNNER_OS" == Windows ]]; then
    executables/windows/app.exe $PROJECT_DIR
elif [[ "$RUNNER_OS" == Linux ]]; then
    executables/linux/app.exe $PROJECT_DIR
elif [[ "$RUNNER_OS" == macOS ]]; then
    executables/macos/app.exe $PROJECT_DIR
else
    echo "Unsupported OS: $RUNNER_OS";
    exit 1;
fi
