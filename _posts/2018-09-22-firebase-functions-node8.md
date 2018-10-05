---
date: 2018-09-22
title: Firebase Functionsをnode8で動かす
categories:
  - firebase
description: "Tips on developing Firebase"
type: Document
---

## 前置き
Cloud Functionsのnode8対応が発表されました。
- https://cloud.google.com/blog/products/gcp/cloud-functions-serverless-platform-is-generally-available

node8はES2017のasync/awaitをサポートしています。
本ページでは、Firebase Functionsでasync/awaitが使える環境を準備する手順を紹介します。

## 前提

- javascriptでcloud functionsをデプロイ出来る環境が構築済みであること
- async/awaitの使い方を知っていること

- 以下のコードををdeployして、`https://<your-project>.cloudfunctions.net/hello`にブラウザからアクセスして`Hello, cloud functions!`が表示されればOK。
```
  exports.hello = functions.https.onRequest((request, response) => {
      response.send("Hello, cloud functions!")
  })
```

## 今回のゴール

- 以下のコードをdeployして`https://<your-project>.cloudfunctions.net/helloAsync`にブラウザでアクセスして`Hello, async/await!`が表示されればOK
```
  exports.helloAsync = functions.https.onRequest(async (request, response) => {
         try {
          var ret = await asyncFunction()
              response.send(ret)
          } catch (error) {
              console.log(error)
              response.status(500).send(error)
          }
  })
  async function asyncFunction() {
      return new Promise(resolve => {
        setTimeout(() => resolve('Hello, async/await!'), 3000);
      });
  }
```

## 設定
1. nodeのバージョンを8.xにする
開発環境のnodeバージョンを8.xにする。nvmを使っている場合は以下。
```
$ nvm use <v8.12.0>

$ node --version
v8.12.0
```

2. firebase-toolsのバージョンを4.0.0以上に上げる
```
$ npm install -g firebase-tools
or
$ npm install -g firebase-tools
```
3. Firebase Functionsのバージョンを上げる
- package.json
  - firebase functionsのバージョンを2.0.0以上に上げます。依存するモジュールのバージョンも上げる必要があります。
```
  "firebase-functions": "^2.0.5"
```

4. enginesでnode8を指定する
- package.json
```
      "engines": {
        "node": "8"
      }
```
4. lintでEcmaScriptのバージョンを2017にする
- .eslint.rc
```
   "ecmaVersion": 2017
```

