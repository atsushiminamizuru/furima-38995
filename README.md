# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :addresses, dependent: :destroy

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_name  | string     | null: false                    |
| item_info  | text       | null: false                    |
| item_price | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_one :order, dependent: :destroy
- has_one :address, dependent: :destroy
- belongs_to :user

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column       | Type          | Options                        |
| ------------ | ------------- | ------------------------------ |
| postal_code  | string        | null: false                    |
| city         | string        | null: false                    |
| addresses    | string        | null: false                    |
| building     | string        | null: false                    |
| phone-number | string        | null: false                    |
| item         | references    | null: false, foreign_key: true |
| user         | references    | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
