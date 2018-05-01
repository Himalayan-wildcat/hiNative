# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_name|string|null: false, unique: true|
|avatar|string|
|email|string|null: false, unique: true|
|password|integer|null: false|

### Association
- has_many :messages
- has_many :categories


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|list|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :messages
