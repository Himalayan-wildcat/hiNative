# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|avatar|string|

### Association
- has_many :chats
- has_many :categories, through: :user_categories
- has_many : user_categories


## chatsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|reference|foreign_key: true
|admin|reference|foreign_key: true
<!--
下記属性はawsで管理する為、本DB内の管理対象外とする。
　ー audio_url
　ー avatar_url
　ー image_url
--!>

### Association
- belongs_to :user
- belongs_to :admin


## adminテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :chats


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|list|string|null: false

### Association
- has_many :user_catogories
- has_many :users, through: : user_categories

## user_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true
|category|references|foreign_key: true

### Association
- belongs_to :user
- belongs_to :category
