# README

# テーブル設計

## Usersテーブル

| column             | type   | option      |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_yomigana     | string | null:false  |
| last_yomigana      | string | null:false  |
| birth              | Date   | null: false |

### Association

- has_many :items
- has_many :purchases


## Itemsテーブル

| column          | type    | option      |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| introduction    | text    | null: false |
| price           | integer | null: false |
| status_id       | integer | null: false |
| category_id     | integer | null: false |
| burden_id       | integer | null: false |
| prefecture_id   | integer | null: false |
| shipping_day_id | integer | null: false |


### Association

- has_one    :purchase
- belongs_to :user



## Shippingsテーブル

| column        | type       | option            |
| ------------- | ---------- | ----------------- |
| postal        | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| number        | string     | null: false       |
| phone         | string     | null: false       |
| purchases     | references | foreign_key: true |
| build         | string     | -                 |

### Association

- belongs_to :purchase

## Purchasesテーブル

| column  | type       | option            |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |
| comment | text       | -                 |

### Association

- has_one    :shipping
- belongs_to :user
- belongs_to :item