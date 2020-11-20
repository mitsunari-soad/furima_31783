# README

# テーブル設計

## Usersテーブル

| column             | type       | option                   |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | null: false              |
| email              | string     | null: false              |
| encrypted_password | string     | null: false,unique: true |
| first_name         | string     | null: false              |
| last_name          | string     | null: false              |
| birth              | integer    | null: false              |

### Association

- has_many :item
- has_many :purchases


## Itemsテーブル

| column             | type       | option            |
| ------------------ | ---------- | ----------------- |
| name               | string     | null: false       |
| introduction       | text       | null: false       |
| price              | integer    | null: false       |
| status_id          | integer    | null: false       |
| category_id        | integer    | null: false       |
| burden_id          | integer    | null: false       |
| shipping_source_id | integer    | null: false       |
| shipping_day_id    | integer    | null: false       |
| shipping           | references | foreign_key: true |
| purchase_item      | references | foreign_key: true |


### Association

- has_one    :purchase
- belongs_to :user



## Shippingsテーブル

| column        | type       | option            |
| ------------- | ---------- | ----------------- |
| postal        | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| number        | integer    | null: false       |
| phone         | integer    | null: false       |
| purchases_id  | references | foreign_key: true |

### Association

- belongs_to :purchase

## Purchasesテーブル

| column  | type      | option            |
| ------- | --------- | ----------------- |
| user_id | reference | foreign_key: true |
| item_id | reference | foreign_key: true |
| comment | text      | -                 |

### Association

- has_one    :shippings
- belongs_to :user
- belongs_to :item