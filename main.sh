#!/usr/bin/env bash

if [[ "$RUNNER_OS" =~ ^windows* ]]; then
    executables/windows/app.exe
elif [[ "$RUNNER_OS" =~ ^ubuntu* ]]; then
    executables/linux/app.exe
elif [[ "$RUNNER_OS" =~ ^macos* ]]; then
    executables/macos/app.exe
else
    echo "Unsupported OS: $RUNNER_OS";
    exit 1;
fi
