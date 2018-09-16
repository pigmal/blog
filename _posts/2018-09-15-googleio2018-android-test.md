---
date: 2018-09-15
title: Keywords in "Frictionless Android testing write once, run everywhere" @ Google I/O 2018
video_id: wYMIadv9iF8
description:
categories:
  - google
resources:
  - name: Event Page
    link: https://events.google.com/io/
type: Video
set: google-io-2018
set_order: 6
---
## piramid
- Unit test: Mochito, robolectric
- Integration / e2e testing: espresso, Android testing support library
## given / when / then
## Mochito / Robolectric / espresso
## Test support library → Android Test in jetpack
- Scaffolding
  - `InstrumentationRegistory.getTargetContext()`がoff deviceでも使えるようになった
- given
  - `ActivityTestRule`もoff deviceで使えるようになった
  - `buildMotionEvent`でイベント発火できるようになった
- When
  - espresso2 off device support in jetpack
- Then
  - Intents/Assertion
## Project Nitrogen
- Integrated Android Studio
- Setup / Execute / Report
## robolectric  4.0 https://github.com/robolectric/robolectric/releases/tag/robolectric-4.0-alpha-1
- jetpackの一部になった
- androidx.testパッケージ
## link
- https://codelabs.developers.google.com/codelabs/bazel-android-intro/
    