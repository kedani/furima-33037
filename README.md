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

### Association

* has_many :items
* has_many :orders

## items

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item-name                           | string     | null: false       |
| item-info                           | string     | null: false       |
| item-category                       | string     | null: false       |
| item-sales-status                   | string     | null: false       |
| item-shipping-fee-status            | integer    | null: false       |
| item-prefecture                     | string     | null: false       |
| item-scheduled-delivery             | string     | null: false       |
| item-price                          | integer    | null: false       |
| add-tax-price                       | integer    | null: false       |
| profit                              | integer    | null: false       |
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

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| postal-code | string     | null: false       |
| prefecture  | string     | null: false       |
| city        | string     | null: false       |
| addresses   | string     | null: false       |
| building    | string     | null: false       |
| phone_number| integer    | null: false       |
| user        | references | foreign_key: true |

### Association

- belomgs_to :order