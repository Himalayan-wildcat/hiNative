# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|avatar|string|

### Association
- has_many :questions
- has_many :categories, through: :user_categories
- has_many : user_categories


## questionsテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user|reference|foreign_key: true

### Association
- belongs_to :user


## user_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true
|category|references|foreign_key: true

### Association
- belongs_to :user
- belongs_to :category


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|list|string|null: false

### Association
- has_many :user_catogories
- has_many :users, through: : user_categories
