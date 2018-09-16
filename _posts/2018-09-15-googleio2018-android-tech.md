  ---
date: 2018-09-15
title: Keywords in sessions about technical detail of Android @ Google I/O 2018
video_id: YyDnYaFtRS0
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

## [Understanding Android memory usage](https://www.youtube.com/watch?v=w7K0jio8afM)

- memory impact with shared page
  - RSS (Resident Set Size)
  - PSS (Proportional Set Size) ← use this
  - USS (Unique Set Size)
- memory pressure
- apk size減らすとmemory usageも減らせがち

## [What's new in Android Runtime](https://www.youtube.com/watch?v=Yi9-BqUxsno)
- (idea) cloud profile (profile from Nugat)

## [Sound Amplifier and the new Dynamics Processing Effect](https://www.youtube.com/watch?v=_hPlNoF1Tyc)
  - demo

## [Drawn out: how Android renders](https://www.youtube.com/watch?v=zdQRIYOST64)

## [Protips: a fresh look at advanced topics for Android experts](https://www.youtube.com/watch?v=eHjHlujp3Tg)
  - 非同期通信について
    - PからANRでダイアログは表示されずに落ちる https://www.xda-developers.com/android-p-app-not-responding-crash-dialogue/
  - ContentProvider → room


## [Building feature-rich media apps with ExoPlayer](https://www.youtube.com/watch?v=svdq1BWl4r8)
- めっちゃ実装

## [Build for Android (Go edition): optimize your app for global markets](https://www.youtube.com/watch?v=-g7yxxTpF2o)
    - entry level device はIndiaの次がUS
    - アプリのインストールコンバージョンとサイズは負の相関がある
    - apkを小さくしよう

## [Effective ProGuard keep rules for smaller applications](https://www.youtube.com/watch?v=x9T5EYE-QWQ)
  - next billionはLimited resources
  - アプリのサイズは単調増加
  - グラフ表示するだけのアプリでダウンロードサイズが2MB、展開して4MB
  - Apk Analyzerで見てみる
    - Guavaが1.4MB ← collection使うだけ
  - minifyEnable=true にするとめっちゃエラー出る
    - ググると -dontwarn *
  - progurd/r8
    - minification(obufuscate)
    - shrinking
    - -keep Activity, Layout
    - ライブラリをkeep class com.androidplot.**のようにまるっと除外するのは良くない
      - log見て対象クラスを特定しよう
      -  -keep,allowshrinking
      - keepclassmembers
    - 開発初期からサイズを意識しよう
    - ライブラリ開発者はkeepルールをちゃんと公開しよう

## [Modern Android development: Android Jetpack, Kotlin, and more](https://www.youtube.com/watch?v=IrMw7MEgADk&t=1171s)
- History of Android development
- Tools
  - Hierarchy Viewer → Layout Inspector
  - Trace View, Systrace, DDMS → Profiler
  - Layout editor
- Runtime & Language
  - Dalvik → ART
    - allocation / appropriate types
  - Java → Kotlin
    - https://android.github.io/kotlin-guides/index.html
- APIs
  - ConstraintLayout
    - AbsoluteLayout / GridLayout / FlameLayout / RelativeLayout
  - RecyclerView
    - ListVIew / GridView / Gallery
  - Fragments
    - Core platform API @deprecated
  - Activity
    - Use single activities when possible
  - Architecture
    - Google don’t have any opinion 2 years before
    - Lifecycle
    - ViewModel, LiveData
    - Room
    - Paging
  - Graphics
    - Reccommended libraries: Glide, Picasso, Lottie
- Best Coding Practices
  - Don’t change
  - Profile your code / Avoid work when possible / Minimize memory consumption


## [Android fireside chat](https://www.youtube.com/watch?v=V7E62C9GWFs)

- AACについて
- タブレットサポートについて
  - https://techcrunch.com/2018/06/01/google-quits-selling-tablets/
- 途中で強風
- Android 1.0から作り直したいなら
- ステージ外のGooglerが答えてるのが多くて面白かった
