---
date: 2018-12-26T09:00:00+09:00
title: USBポートサイズマイコン「Tomu」の開発環境構築
video_id: JwDfoIl4YpA
categories:
  - IoT
description: "Getting started with Tomu"
type: Video
---

## tomuとは

tomuはUSBタイプAのポートにすっぽりとはまる、超小型のマイコンボードで、2つのボタン（タッチセンサ）と2つのLEDを搭載し、USBからの給電で動作します。

設計情報はすべてオープンソースで、PCBやケースを含めて12点の部品でできています。

USB DFU(Device Firmware Update)に対応しているので、専用ツールを必要とせずに、プログラムを書き込めます。

**主なスペック** 

```
CPU: Silicon Labs Happy Gecko EFM32HG309
Clock: 25 MHz ARM Cortex-M0+
RAM: 8 KB
Flash: 64 KB フラッシュ
Interface：USB 2.0 FS
ボタン: 2
LED: 2 (赤 + 緑)
```

**入手方法**

国内ではスイッチサイエンスで販売しています。

https://www.switch-science.com/catalog/5254/



## 開発環境の構築

[quick start](https://github.com/im-tomu/tomu-quickstart/)に従って開発環境を構築していきます。プログラムをビルドしてtomuに書き込んで実行するには以下3つのツールが必要です。

- ARM toolchain
- Make
- dfu-utils

**An ARM toolchain**

ARMの開発者向けページ( [GNU Toolchain | GNU Arm Embedded Toolchain – Arm Developer](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm) )からDLするのが確実ですが、ここではpx4というオープンソースドローンのプロジェクトが公開しているformulaを使ってbrewでインストールする方法をご紹介します。

- px4 <https://px4.io/>
- github <https://github.com/PX4/homebrew-px4>

以下コマンドでインストールします。

```
$ brew tap PX4/homebrew-px4
$ brew update
$ brew install gcc-arm-none-eabi
```

**Make**

MakeはXCodeにバンドルされています。XCodeをインストールしていない場合はインストールして、以下のようにコマンドが実行出来ることを確認しておきます。

```
$ make -v
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for i386-apple-darwin11.3.0
```

**dfu-utils**

tomuはUSB DFU(Device Firemware Update)という標準仕様に準拠しているため、専用のツールを必要とせずに、DFU用の汎用ツールでファームウェアを書き込めます。

dfu-utilはbrewでインストールできます。

```
$ brew install dfu-util
```

エラーが出る場合は

```
$ brew doctor
```

を実行して、表示される指示に従います。


## サンプルの実行

githubからサンプルコードを取得します。

```
$ git clone git@github.com:im-tomu/tomu-quickstart.git
$ cd tomu_quickstart
```

このリポジトリに以下サンプルが含まれています。

| - | - |
| ---------------- | ------------------------------------------------------------ |
| **bare-minimum** | Does nothing, forever, without crashing.                     |
| **miniblink**    | Blink the two LEDs using the SysTick timer.                  |
| **usb-hid**      | Emulate a USB mouse, and wiggle the cursor back and forth.   |
| **usb-msc**      | Emulate a very small “USB Mass Storage” disk drive.          |
| **usb-midi**     | Provide a USB MIDI device that continuously sends NoteOn and NoteOff events. |
| **usb-cdcacm**   | Communicate with Tomu over a virtual serial port.            |
| **opticspy**     |                                                              |



tomuをUSBポートに差し込み、任意のディレクトリ内でmakeし、dfu-utilでtomuに新しいファームウェアを書き込みます。

```
$ cd usb-hid-keyboard
$ make
$ dfu-util --download usb-hid-keyboard.dfu
```

## WebUSBでファームウェアを書き込む
Tomuは、ファームウェアの書き込みだけであれば、上記のような手順を踏まずに、WebUSB仕様に基づいて、ブラウザからファームウェア書き込みが出来ます。

TomuをUSBポートに差し込むと、bootloaderを認識したとポップアップメッセージが出るのでクリックすると、以下ページが開きます。

https://dfu.tomu.im/

こちらのWebUI上で、以下の手順でファームウェアを書き込みます。

- VenderIDで`dapboot DFU bootloader`を選択し`connect`ボタンをクリック
- ダイアログが表示されるので、`Tomu Bootloader`を選択して`connect`
- Firmware Downloadの`Choose file`ボタンを押して書き込む.dfuファイルを選択し、`download`ボタンをクリックで書き込み開始


## 参考

- 公式サイト <https://tomu.im/>
  - quick start <https://github.com/im-tomu/tomu-quickstart/>
  - sample <https://tomu.im/samples>
- 購入 https://www.switch-science.com/catalog/5254/
- misc
  - U2F (https://github.com/im-tomu/chopstx/tree/efm32/u2f)
  - WebUSB (https://wicg.github.io/webusb/)
  - dapboot (https://github.com/devanlai/dapboot)
  - px4 (https://px4.io/)
