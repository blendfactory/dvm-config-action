#!/usr/bin/env bash

if [[ "$RUNNER_OS" =~ ^windows* ]]; then
    scripts/windows/app.exe
elif [[ "$RUNNER_OS" =~ ^ubuntu* ]]; then
    scripts/ubuntu/app.exe
elif [[ "$RUNNER_OS" =~ ^macos* ]]; then
    scripts/macos/app.exe
else
    echo "Unsupported OS: $RUNNER_OS";
    exit 1;
fi
