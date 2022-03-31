#テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| name               | string     | null: false                    |
| kana               | string     | null: false                    |
| birthday           | string     | null: false                    |
| purchasers_id      | references | null: false, foreign_key: true |
### Association
-has_many :purchasers
-has_many :items

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| items_name         | string     | null: false                    |
| items_comments     | text       | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_price_id  | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |

### Association
-belongs_to :user
-has_one :purchaser

##purchasersテーブル
| Column             | Type    | Options     |
| ------------------ | --------| ----------- |
| post_code          | integer | null: false |
| prefecture_id      | integer | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| building_name      | string  | null: false |
| phone_number       | integer | null: false |

### Association
-belongs_to :user
-belongs_to :item