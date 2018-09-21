---
date: 2018-09-20
title: Kotlin Tips
categories:
  - android
description: "Tips on developing Android"
type: Document
---

## kotlinからjavaを呼ぶ場合の型について

kotlinの型には`non-null`, `nullable`と`platform`の3種類がある。
通常の`Type`はnon-nullで、型に`Type?`をつけるとnullable、Javaで実装されていてアノテーション指定されてないものはplatform typeで`Type!`を付けて表示される。

アノテーションで指定されているものは、kotlinではnon-null, nullableになる。
- 呼び出される側のjavaコード
```
  public class Foo {
    @Nonnull
    public static String getHoge() {
        return "hoge";
    }
    @Nullable
    public static String getFuga() {
      return "huga";
    }
    public static String getPiyo() {
      return "piyo";
    }
  }
```

- 呼び出す側のkotlinコード
```
  val hoge = Foo.getHoge() // String
  val fuga = Foo.getFuga() // String?
  val piyo = Foo.getPiyo // String!
```

参考
- [Calling Java code from Kotlin](https://kotlinlang.org/docs/reference/java-interop.html)


## Boolean?を条件で使う場合

Boolean型の場合、ifの条件に値をそのまま入れることが出来る。
```
  val flag: Boolean = true

  if (flag) {
    ...
  }
```

Boolean?型の場合は
```
  val flag: Boolean? = null
  if (flag == true) {
      ...
  }
```
