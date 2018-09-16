---
date: 2018-09-15
title: Keywords in sessions about tools for Android @ Google I/O 2018
description:
categories:
  - google
resources:
  - name: Event Page
    link: https://events.google.com/io/
type: Document
set: google-io-2018
set_order: 6
---

## [What's new in Android development tools](https://www.youtube.com/watch?v=WxAZk7A7OkM)

- Android Studio3.2の機能紹介
  - app bundle
  - profiler
  - ar.sceneforme, glTF
  - jetpack
    - androidx refactoring
    - navigation
    - デザインヘルパーでサンプルデータが入れられるようになった
    - motion layout のsneak preview (3.3?)
    - ★Chrome bookでAndroid Studioが動くようになった
  - D8&R8 dexer & optimizer

## [What's new with the Android build system](https://www.youtube.com/watch?v=N5xONyp69eU)

- D8
- App Bundle
- Namespaced Resource (opt in from 3.3RC)
- ビルドシステムが変わるらしいDSLやAPIも変わるかも(3.3)

## [What's new with ConstraintLayout and Android Studio design tools](https://www.youtube.com/watch?v=ytZteMo4ETk)

- editor
  - conversion
  - layout
  - editor上でのサンプルデータなど
  - Design time attribute
    - テキストの色、リストビューアイテムの数
    - sample data
      - custom sample data
- constraint layout 2.0
  - helper
    - layout manipulation
      - Linear, Flow = flexbox
    - post layout manipulation
      - Layers: apply graphical manipulate a collection of views
    - rendering or decorating
      - circular reveal
      - decorators: Lava, bottom panel
      - アニメーションのデモがある → no code, declarative
  - live resize: chrome bookを意識
  - motion layout
    - 2.2
    - key frame
    - nested montionlayout: view animated by another motion
    - synchronized movement
    - cycles: keyframのより細かいやつ？
    - IDEでアニメーションサポートしてるよ

## [Best practices using compilers in Android Studio](https://www.youtube.com/watch?v=gGOOkk2y_Ss)

- desuger
- D8
  - デバッグ時の挙動が改善
- preview R8
  - Shrinker & Optimizer
  - proguardやdesugerを1プロセスで (proguardはjava to java)
