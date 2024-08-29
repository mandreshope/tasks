# tasks

A task management app that allows users to add, edit, delete and mark tasks as complete. The app should be functional on both Android and iOS.

## flutter sdk

- Flutter SDK 3 or higher

## Getting Started

This project is a starting point for a Flutter application.

- [Installation guide](https://docs.flutter.dev/get-started/install)

## Development tool

This projects uses code generator

```
flutter packages pub run build_runner build
```

- Resolves `json_serializable`

```
flutter pub run build_runner build --delete-conflicting-outputs
```

- Run this command to detect packages unused

```batch
dart pub global activate dependency_validator && dart pub run dependency_validator
```

## flutter_launcher_icons

Icon launcher generator

- [Docs here](https://pub.dev/packages/flutter_launcher_icons)

```
flutter pub run flutter_launcher_icons:main
```

## LCOV - code coverage report

To install LCOV in your pc follow this [link for macOs or linux](https://stackoverflow.com/questions/50789578/how-can-the-code-coverage-data-from-flutter-tests-be-displayed), for windows os follow this [link for windows](https://fredgrott.medium.com/lcov-on-windows-7c58dda07080)

Show code coverage report

1. Run tests

```batch
flutter test --coverage
```

2. To exclude all generated file in flutter test coverage

- MacOs or Linux

```batch
lcov --remove coverage/lcov.info 'lib/*.g.dart' 'lib/*.gql.dart' 'lib/*.freezed.dart' 'lib/*.mocks.dart' -o coverage/lcov.info
```

- Windows

```batch
perl %LCOV% --remove coverage/lcov.info -o coverage/lcov.info lib/**/*.g.dart
```

3. Generate lcov.info file to html

- MacOs or Linux

```
genhtml coverage/lcov.info -o coverage/html
```

- Windows

```batch
perl %GENHTML% -o coverage\html coverage\lcov.info
```

4. Open coverage report in browser

- MacOs or Linux

```batch
open coverage/html/index.html
```

- Windows

```batch
start coverage/html/index.html
```

## Golden test

Run all test and golden test

```batch
flutter test --update-goldens
```

Run only golden test

```batch
flutter test --update-goldens --tags=golden
```

## Build apk

Run this script in project root to create apk

```batch
./scripts/build_app.sh
```

## if keystore not exists

copy key.properties and keystore.jks to /android/


## Screenshots

Screenshots demonstrating the application's features.

| <img src="https://raw.githubusercontent.com/mandreshope/tasks/main/.github/assets/benchmarks/screen1.png" width="100%" /> | <img src="https://raw.githubusercontent.com/mandreshope/tasks/main/.github/assets/benchmarks/screen1_list_task.png" width="100%" /> |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| <img src="https://raw.githubusercontent.com/mandreshope/tasks/main/.github/assets/benchmarks/screen1_all_list.png" width="100%" /> | <img src="https://raw.githubusercontent.com/mandreshope/tasks/main/.github/assets/benchmarks/screen2_save.png" width="100%" />  |
| ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| <img src="https://raw.githubusercontent.com/mandreshope/tasks/main/.github/assets/benchmarks/screen3_task_detail.png" width="100%" />  |