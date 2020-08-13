#テーブル設計

## users テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name                  | string | null: false |
| name_reading          | string | null: false |
| birthday              | date   | null: false |

### Association
- has_many :items
- has_many :purchases
- has_one :addresses

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | text       | null: false                    |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category           | integer    | null: false                    |
| condition          | integer    | null: false                    |
| delivery_fee       | integer    | null: false                    |
| ship_from_location | integer    | null: false                    |
| delivery_date      | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| price   | integer    | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |
| user_id       | references | null: false, foreign_key: true |

### Association
belongs_to :user
