# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| profile            | text                | null: false             |
| birthday           | string              | null: false             |

### Association

* has_many :items
* has_many :orders

## items

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| price                               | integer    | null: false       |
| image                               | string     | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

## orders

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| card        | text       | null: false       |
| user        | references | foreign_key: true |

### Association

- belomgs_to :user
- belongs_to :items
- has_one :shared

## shared

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| shipping    | integer    | null: false       |
| user        | references | foreign_key: true |
| addres      | text       | null: false       |

### Association

- belomgs_to :orders