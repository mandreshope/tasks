#!/bin/bash

# Set the path to your Flutter project
PROJECT_PATH="."

# Navigate to the project directory
cd "$PROJECT_PATH"

# Clean the project
flutter clean

# Get the latest dependencies
flutter pub get

# Get the version from pubspec.yaml
VERSION=$(grep 'version:' pubspec.yaml | awk -F ': ' '{print $2}')

# Build and rename function for APK
build_and_rename_apk() {
  local flavor="$1"
  flutter build apk

  # Determine the output directory based on the flavor
  OUTPUT_DIR="$PROJECT_PATH/build/app/outputs/flutter-apk"

  # Rename the output APK file with the version
  APK_FILE="$OUTPUT_DIR/app-release.apk"
  NEW_APK_NAME="$OUTPUT_DIR/${flavor}_v$VERSION.apk"
  mv "$APK_FILE" "$NEW_APK_NAME"

  echo "Build completed and APK for $flavor renamed to $NEW_APK_NAME"
}

# Build and rename function for IPA
build_and_rename_ipa() {
  local flavor="$1"
  flutter build ipa

  # Determine the output directory for the IPA file
  OUTPUT_DIR="$PROJECT_PATH/build/ios/ipa"

  # Rename the output IPA file with the version
  IPA_FILE="$OUTPUT_DIR/app.ipa"
  NEW_IPA_NAME="$OUTPUT_DIR/${flavor}_v$VERSION.ipa"
  mv "$IPA_FILE" "$NEW_IPA_NAME"

  echo "Build completed and IPA for $flavor renamed to $NEW_IPA_NAME"
}

# Build and rename for tasks
build_and_rename_apk "tasks"

# Check if the OS is macOS before attempting to build the IPA
if [[ "$OSTYPE" == "darwin"* ]]; then
  build_and_rename_ipa "tasks"
else
  echo "Skipping IPA build; not running on macOS."
fi
