# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| surname            | string              | null: false             |
| first name         | string              | null: false             |
| birthday           | date                | null: false             |
| surname_kana       | string              | null: false             |
| first name_kana    | string              | null: false             |
### Association

* has_many :items
* has_many :orders

## items

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item-name                           | string     | null: false       |
| item-info                           | string     | null: false       |
| item-category_id                    | integer    | null: false       |
| item-sales-status_id                | integer    | null: false       |
| item-shipping-fee-status_id         | integer    | null: false       |
| item-prefecture_id                  | integer    | null: false       |
| item-scheduled-delivery_id          | integer    | null: false       |
| item-price                          | integer    | null: false       |
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
| postal-code  | string     | null: false       |
| prefecture_id| integer    | null: false       |
| city         | string     | null: false       |
| addresses    | string     | null: false       |
| building     | string     |                   |
| phone_number | string     | null: false       |
| order        | references | foreign_key: true |

### Association

- belomgs_to :order