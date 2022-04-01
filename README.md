#テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first-name         | string     | null: false                    |
| last-name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
-has_many :orders
-has_many :items

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| items_name         | string     | null: false                    |
| items_comments     | text       | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_price_id  | integer    | null: false                    |
| shipping_area_id   | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |

### Association
-belongs_to :user
-has_one :order

## ordersテーブル
| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| user               | references | null: false, foreign_key: true|
| item               | references | null: false, foreign_key: true|

### Association
-belongs_to :items
-belongs_to :user
-has_one :address

## addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
-belongs_to : order