## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birth_date         | date   | null: false                |


### Association
- has_many :books
- has_many :old_books
- has_many :orders

## booksテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| book_name          | string     | null: false                    |
| category_id        | integer    | null: false                    |
| book_review        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## old_booksテーブル

| Column               | Type       | Options                        |
| ------------------   | ---------- | ------------------------------ |
| old_book_name        | string     | null: false                    |
| old_book_description | text       | null: false                    |
| category_id          | integer    | null: false                    |
| book_condition_id    | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| area_id              | integer    | null: false                    |
| delivery_time_id     | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| old_book           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :old_book
- has_one :address

## addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association
- belongs_to :order