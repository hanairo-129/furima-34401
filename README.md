# README

# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| email               | string  | unique:true |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false | #苗字
| last_name.reading   | string  | null: false | #苗字ヨミガナ
| first_name          | string  | null: false | #名前
| first_name.reading  | string  | null: false | #名前ヨミガナ
| nick_name           | string  | null: false | #ニックネーム
| birthday_year       | integer | null: false | #生年月日：年
| birthday_month      | integer | null: false | #生年月日：月
| birthday_day        | integer | null: false | #生年月日：日

### Association

- has_many :items
- has_many :records

## items テーブル

| Column      | Type          | Options           |
| ----------- | ------------- | ----------------- |
| item.name   | string        | null: false       |
| status_id   | integer       | null: false       |#商品の状態
| delivery_id | integer       | null: false       |#配送料の負担
| area_id     | integer       | null: false       |#発送元の地域
| times_id    | integer       | null: false       |#発送までの日数
| category_id | integer       | null: false       |#カテゴリー
| price       | integer       | null: false       |
| details     | text          | null: false       | #詳細
| user        | references    | foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル  #発送先情報

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       | #郵便番号
| area_id       | integer    | null: false       | #都道府県
| city          | string     | null: false       | #市町村
| house_number  | string     | null: false       | #丁目、番地、号
| building_name | string     |                   | #建物名
| phone_number  | string     | null: false       | #電話番号
| record        | references | foreign_key: true |

### Association

- belongs_to :record
