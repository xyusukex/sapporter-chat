# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| prefectures        | string | null: false              |
| age                | string | null: false              |
| self_introduction  | text   | null: false              |
| clubteam_id        | string | null: false              |


### Association

- has_many :publicposts
- has_many :publiccomments
- has_many :user_rooms
- has_many :rooms
- has_many :groupposts
- has_many :groupcomments
- has_many :follows



## publicposts テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| publicpost_text   | text       | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :publiccomments

## publiccomments テーブル

| Column                    | Type        | Options     |
| ------------------------- | ----------- | ----------- |
| publiccomment_text        | text        | null: false |
| publicpost                | references  | null: false, foreign_key: true |
| user                      | references  | null: false, foreign_key: true |

### Association

- belongs_to  :user
- belongs_to  :publicpost

## user_rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| room   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## rooms テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| roomname        | string     | null: false |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :user_rooms
- has_many :groupposts
- has_many :groupcomments

## groupposts テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| grouppost_text  | text       | null: false |
| user            | references | null: false, foreign_key: true |
| room            | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- has_many :groupcomments

## groupcomments テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| grouppost_text  | text       | null: false |
| user            | references | null: false, foreign_key: true |
| room            | references | null: false, foreign_key: true |
| grouppost       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room
- belongs_to :groupposts


## follews テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| follower_id     | references | null: false, foreign_key: true |
| followee_id     | references | null: false, foreign_key: true |
s
### Association

- belongs_to :user