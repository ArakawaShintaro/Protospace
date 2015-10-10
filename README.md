# Protospace
テーブル名
users
prototypes
images
tags
prototypes_tags
comments
likes

**Usersテーブル**
id (integer)
name (string)
mail (string)
password (string)
member (string)
profile (text)
works (string)
avatar(画像)

関連
has_many prototypes
         comments
         likes

=> 6のUser管理機能のときに導入
​
**Prototypesテーブル**
id (integer)
title (string)
catch copy (string)
concept (text)
user_id (integer)

アソシエーション
belongs_to user
has_many comments
         likes
         image
has_many tags, through: :prototypes_tags

=> 7のプロトタイプ投稿機能のときに導入
​
​
**Tagsテーブル**
id (integer)
title (string)

アソシエーション
has_many prototypes, through: :prototypes_tags
​
=>11のタグ機能のときに導入

**prototypes-tagsテーブル(中間テーブル)**
tag_id (integer)
proyotype_id (integer)

=> 11のタグ機能追加のときに導入

**imagesテーブル**
id
image
prototype_id

アソシエーション
belongs_to prototype



=> 7のプロトタイプ投稿機能のときに導入

**commentsテーブル**
id (integer)
text (text)
user_id (integer)
prototype_id (integer)

アソシエーション
belongs_to user
           prototype



=> 9のコメント機能のときに追加

**likesテーブル**
id (integer)
user_id (integer)
prototype_id (integer)

アソシエーション
belongs_to user
           prototype

=> 9のlike機能のときに導入
