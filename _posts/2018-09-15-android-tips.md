---
date: 2018-09-10
title: Android Tips
categories:
  - android
description: "Tips on developing Android"
type: Document
---
## デバッグ署名のSHA-1を取得する
Debug signing certificate SHA-1
```
$ keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android 
```

## adb
### preferences等、アプリの内部データを確認する
```
$ adb shell

254|cedric:/ $ run-as <package name>
254|cedric:/ $ ls
app_textures app_webview cache databases files lib no_backup shared_prefs
```

### Screenshotを撮る
```
$ adb exec-out screencap -p > screen.png
```

### Screenを動画で撮る
```
$ adb shell screenrecord /sdcard/screen.mp4
(Ctrl+Cで止める)
$ adb pull /sdcard/screen.mp4
```
