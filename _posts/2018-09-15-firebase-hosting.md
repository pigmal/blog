---
date: 2018-09-10
title: Setup Firebase Hosting
categories:
  - firebase
description: "How to host website on Firebase"
type: Document
---

## precondition
- firebase CLIがインストール済みであること

## 設定
firebase CLIでプロジェクトおよび公開するファイルのディレクトリなどを指定する
```
$ firebase init
```
- 以下の画面が表示される
![Firebase CLI init](/images/post/firebase-cli-init.png)
- `Hosting`カーソルを合わせてスペースでチェックしてEnter
- projectを選択
- 公開するdirectoryを指定。デフォルトは`public`
- `Configure as a single-page app (rewrite all urls to /index.html)?`
  - 必要があればYes
- 以下のファイルが生成される

```
.firebaserc
firebase.json
```

## デプロイ
- ローカル実行
```
$ firebase serve
```
- デプロイ
```
$ firebase deploy --only hosting
```

## 複数サイトをHostingをする場合
- [公式情報](https://firebase.google.com/docs/hosting/multisites)

### サイトの追加
- firebase console上で、`add another site`
- `<site-name>.firebaseapp.com`というURLのサイトを取得する
![Firebase Hosting add site](/images/post/firebase-hosting-add-site.png)

### 設定


- CLIでサイトを指定するときの名前(=target)とfirebase hosting上のsiteを紐付ける
```
$ firebase target:apply hosting <target> <site-name>
```

- デフォルトのサイトはsite-nameがプロジェクト名になっているので、以下のようになる。
```
    // for default hosting
    $ firebase target:apply hosting <defalut-site> <project-name>
```

- target:apply で指定した内容は、.firebasercに記述されている。上記を実行すると以下のようになる

- .firebaserc
```
{
  "projects": {
    "default": "<project-name>"
  },
  "targets": {
    "<project-name>": {
      "hosting": {
        "<target>": [
          "<site-name>"
        ],
        "<default-site>": [
          "<project-name>"
        ]
      }
    }
  }
}
```

- targetごとにホスト対象のディレクトリ設定をする。
- (※2018/9/16現在)CLIで設定は出来ず、マルチサイト対応するには`firebase.json`を手書きで修正する必要がある。

- firebase.json
```
{
  "hosting": [{
    "target": "<target>",
    "public": "<path-to-files-for-target>",
  },
  {
    "target": "<default-site>",
    "public": "<path-to-files-for-default>",
  }]
}
```

### デプロイ

- ターゲットを指定してデプロイする
```
$ firebase deploy --only hosting:<target>
```

## 独自ドメイン設定
- firebase consoleでサイトの設定画面を開いて`Connect domain`
- 表示されるテキストをドメインのTXTレコードに設定
![Firebase Hosting original domain](/images/post/firebase-hosting-domain.png)
- しばらくしてDNS設定が確認出来ると、以下のようにAレコード設定情報が表示されるので、設定する
![Firebase Hosting original domain](/images/post/firebase-hosting-domain2.png)
