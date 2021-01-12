# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| email              | string              | null: false  unique: true|
| encrypted_password | string              | null: false              |
| nickname           | string              | null: false              |
| surname            | string              | null: false              |
| first_name         | string              | null: false              |
| birthday           | date                | null: false              |
| surname_kana       | string              | null: false              |
| first_name_kana    | string              | null: false              |
### Association

* has_many :items
* has_many :orders

## items

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item_name                           | string     | null: false       |
| item_info                           | text       | null: false       |
| item_category_id                    | integer    | null: false       |
| item_sales_status_id                | integer    | null: false       |
| item_shipping_fee_status_id         | integer    | null: false       |
| item_prefecture_id                  | integer    | null: false       |
| item_scheduled_delivery_id          | integer    | null: false       |
| item_price                          | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user        | references | foreign_key: true |
| item        | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shared

## shared

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| postal_code  | string     | null: false       |
| prefecture_id| integer    | null: false       |
| city         | string     | null: false       |
| addresses    | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |
| order        | references | foreign_key: true |

### Association

- belongs_to :order