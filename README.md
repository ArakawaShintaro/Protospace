# Protospace DB構成

## テーブル
users
prototypes
images
tags
prototypes_tags
comments
likes

### Usersテーブル
id (integer)
name (string)
email (string)
password (string)
member (string)
profile (text)
works (string)
avatar(画像)

### アソシエーション
has_many prototypes
         comments
         likes

​***

### Prototypesテーブル
id (integer)
title (string)
catch copy (string)
concept (text)
user_id (integer)

### アソシエーション
belongs_to user
has_many comments
         likes
         images
         prototype_tags
has_many tags, through: :prototypes_tags

***
​
​
### Tagsテーブル
id (integer)
title (string)

### アソシエーション
has_many prototypes, through: :prototypes_tags
​
***

### prototypes-tagsテーブル(中間テーブル)
tag_id (integer)
proyotype_id (integer)

***

### imagesテーブル
id
image
prototype_id

アソシエーション
belongs_to prototype

***

### commentsテーブル
id (integer)
text (text)
user_id (integer)
prototype_id (integer)

アソシエーション
belongs_to user
           prototype

***

### likesテーブル
id (integer)
user_id (integer)
prototype_id (integer)

アソシエーション
belongs_to user
           prototype

***
