# テーブル設計

## users テーブル

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| nickname           | string  | null: false                   |
| email              | string  | null: false, uniqueness: true |
| encrypted_password | string  | null: false                   |
| last_name          | string  | null: false                   |
| first_name         | string  | null: false                   |
| last_kana          | string  | null: false                   |
| first_kana         | string  | null: false                   |
| birth_date         | date    | null: false                   |

### Association

- has_many :user_purchases
- has_many :items

## address

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| area_id          | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| address          | string     |                                |
| phone_number     | string     | null: false                    |
| user_purchase    | references | null: false, foreign_key: true |

### Association

- belongs_to :user_purchases
- belongs_to :item
## user_purchases

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address

## items

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| burden_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| day_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user