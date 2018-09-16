---
date: 2018-09-15
title: Keywords in "Build the new, modular Android App Bundle" @ Google I/O 2018
video_id: bViNOUeFuiQ
description:
categories:
  - google
resources:
  - name: Event Page
    link: https://events.google.com/io/
type: Video
set: google-io-2018
set_order: 8
---


## (Intro)
  - Publishing format != APK
  - structure of bundle
    - *.pb : protocol buffer format extension
  - File targeting
    - `res/drawable-<hdmi>` etc
  - Assets targeting
    - `assets/<name>#<lang/tcf/opengl/vulkan>_<value>/…`
## Serving
  - Post L: Split APKs
    - Bundle → Base + resource + architecture + language
  - Pre L : Standalone APKs
    - split to 4 ABIs * 6 Densities
    - all languages are included
## (Facts)
  - 10PB saved per day
  - Twitter 20%
  - textPlus 26%
## Building the Android App Bundle
  - Android Studio 3.2
  - Build → Build Bundle(s) / APK(s) → Bundle(s)
  - `./gradlew modulename:bundleVariant`
  - `modulename/build/outputs/bundleVariant/bundle.aab`
## Signed and ready for publishing
  - bundle block?
  - Enroll in App Signing by Google Play
## Bundle Explorer
## Publishing API
## How to test an Android App Bundle
  - Bundletool
    - `$ bundletool build-apks` `--``bundle=myapp.aab` `--``output=myapp.apks` `--``device-spec=pixel2.json`
    - `$ bundletool install-apks` `--``apks=my-recipe-app.apks`
    - github.com/google/bundletool
## Modularization
  - When to Modularize?
  - Creating a dynamic Feature
    - Android Studio 3.2 New Module
      - manifest
      - build.gradle
  - Play Core Library
    - `SplitInstallManager`
  - Installing Modules
    - SplitCompat on L/M, no need to restart
  - Updating Modules
    - versions are always in sync
    