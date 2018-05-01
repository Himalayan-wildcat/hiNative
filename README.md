# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_name|string|null: false, unique: true|
|avatar|string|
|email|string|null: false, unique: true|

### Association
- has_many :messages
- has_many :catgories, through: :user_categories


## questionsテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: false, foreign_key: true|
|user_id|integer|
|avatar_url|string|
|image_url|string|
|audio_url|string|

### Association
- belongs_to :user


## user_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|
|category|references|

### Association
- has_many :users
- has_many :categories


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|list|string|

### Association
- has_many :users, through: : user_categories

