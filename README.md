# README

# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| email         | string | null: false |
| password      | string | null: false |
| name          | string | null: false |
| name.reading  | string | null: false | #ヨミガナ
| nick_name     | string | null: false | #ニックネーム

### Association

- has_many :items
- has_many :records

## items テーブル

| Column     | Type          | Options           |
| ---------- | ------------- | ----------------- |
| item.name  | string        | null: false       |
| price      | string        | null: false       |
| details    | text          | null: false       | #詳細
| image      | ActiveStorage |                   |
| user       | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :records

## records テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| price      | integer    | null: false       |
| user       | references | foreign_key: true |
| items      | references | foreign_key: true |
### Association

- belongs_to :user
- belongs_to :items
- has_one :addresses

## addresses テーブル  #発送先情報

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       | #郵便番号
| prefecture    | integer    | null: false       | #都道府県
| city          | string     | null: false       | #市町村
| house_number  | text       | null: false       | #丁目、番地、号
| building_name | text       |                   | #建物名
| phone_number  | string     | null: false       | #電話番号
| records       | references | foreign_key: true |

### Association

- belongs_to :records
