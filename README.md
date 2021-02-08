# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------  | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | integer | null: false |
| last_name   | string  | null: false |
| first_name  | string  | null: false |
| last_kana   | string  | null: false |
| first_kana  | string  | null: false |
| birth_year  | integer | null: false |
| birth_month | integer | null: false |
| birth_dey   | integer | null: false |

### Association

- has_many :user_purchases
- has_many :purchases, through: :user_purchases
- has_many :items

## purchases

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| address          | string     |                                |
| phone_number     | integer    | null: false                    |
| item             | references | null: false, foreign_key: true |

### Association

- has_many :user_purchases
- has_many :users, through: :user_purchases
- belongs_to :items

## user_purchases

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| purchase | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase

## items

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| description | text       | null: false                    |
| category    | integer    | null: false                    |
| state       | integer    | null: false                    |
| burden      | integer    | null: false                    |
| area        | integer    | null: false                    |
| day         | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| purchase    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase