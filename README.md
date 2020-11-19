# README

# テーブル設計

## Usersテーブル

| column        | type       | option                   |
| ------------- | ---------- | ------------------------ |
| nickname      | string     | null: false              |
| email         | string     | null: false              |
| password      | string     | null: false,unique: true |
| first_name    | string     | null: false              |
| last_name     | string     | null: false              |
| birth         | integer    | null: false              |
| item_user     | references | foreign_key: true        |
| credit        | references | foreign_key: true        |
| purchase_user | references | foreign_key: true        |

### Association

- has_one  :credit
- has_many :item_users
- has_many :purchases

## Itemsテーブル

| column          | type           | option            |
| --------------- | -------------- | ----------------- |
| name            | string         | null: false       |
| introduction    | text           | null: false       |
| price           | integer        | null: false       |
| image           | active_storage | null: false       |
| status          | string         | null: false       |
| category        | string         | null: false       |
| burden          | integer        | null: false       |
| shipping_source | string         | null: false       |
| shipping_day    | string         | null: false       |
| item_user       | references     | foreign_key: true |
| shipping        | references     | foreign_key: true |
| purchase_item   | references     | foreign_key: true |


### Association

- has_many :item_users
- has_one  :credit
- has_one  :purchase

## Item_userテーブル

| column  | type       | option            |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## Creditsテーブル

| column        | type       | option            |
| ------------- | ---------- | ----------------- |
| information   | integer    | null: false       |
| expiration    | integer    | null: false       |
| security_code | integer    | null:false        |
| user_id       | references | foreign_key: true |

### Association

- belongs_to :user

## Shippingsテーブル

| column     | type       | option            |
| ---------- | ---------- | ----------------- |
| postal     | integer    | null: false       |
| prefecture | string     | null: false       |
| city       | string     | null: false       |
| number     | integer    | null: false       |
| phone      | integer    | null: false       |
| item_id    | references | foreign_key: true |

### Association

- belongs_to :item

## Purchasesテーブル

| column  | type      | option            |
| ------- | --------- | ----------------- |
| user_id | reference | foreign_key: true |
| item_id | reference | foreign_key: true |
| comment | text      | -                 |

### Association

- belongs_to :item
- belongs_to :user