  ---
date: 2018-09-15
title: Keywords in "Migrate your existing app to target Android Oreo and above" @ Google I/O 2018
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

  - targetSDKの話
  - WorkManager
  - BroadcastManager
    - ほとんどの場合、Manifest登録でのアプリ起動はできなくなる
      - There are exceptions of course, it’s android.
  - PからApp Standby Bucketsが導入された。アプリの使用頻度が多いとよりプライオリティの高いバケットへシステムが自動で配置する。アプリがどのバケットにあるかチェック
    - `adb shell am get-standby-bucket <package name>`
![](https://d2mxuefqeaa7sj.cloudfront.net/s_E12C2C69C7C0B5B2E55878BDB8D47C915E2A2792EF14835210D529340EBE2270_1527505884396_Screenshot+2018-05-28+20.10.57.png)

    - non sdk apiをdetectする機能がStrictModeに追加

