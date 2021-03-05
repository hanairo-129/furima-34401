# README

# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| email               | string | unique:true |
| encrypted_password  | string | null: false |
| last_name           | string | null: false | #苗字
| last_name.reading   | string | null: false | #苗字ヨミガナ
| first_name          | string | null: false | #名前
| first_name.reading  | string | null: false | #名前ヨミガナ
| nick_name           | string | null: false | #ニックネーム

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
