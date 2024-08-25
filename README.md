# tasks

A task management app that allows users to add, edit, delete and mark tasks as complete. The app should be functional on both Android and iOS.

## flutter sdk

- Flutter SDK 3

## Development tool

This projects uses code generator

```
flutter packages pub run build_runner build
```

- Resolves `json_serializable`

```
flutter pub run build_runner build --delete-conflicting-outputs
```

## flutter_launcher_icons

Icon launcher generator

- [Docs here](https://pub.dev/packages/flutter_launcher_icons)

```
flutter pub run flutter_launcher_icons:main
```