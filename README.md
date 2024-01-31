# dvm-config-action

A GitHub Action that parses [DVM] config file and extracts the config values.

## Usage

```yaml
    steps:
      - uses: actions/checkout@v4
      - uses: blendfactory/dvm-config-action@v1
        id: dvm-config-action
      - uses: dart-lang/setup-dart@v1
        with:
          sdk: ${{ steps.dvm-config-action.outputs.dart-sdk-version }}
```

<!-- Links -->

[DVM]: https://github.com/blendfactory/dvm
