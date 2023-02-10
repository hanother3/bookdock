# アプリケーション名
bookdock

# アプリケーション概要
読書レビューを投稿し、既読or未読の読書状況を管理。読まなくなった本は古本として出品し、ユーザー同士で購入することができる。

# URL
https://bookdock.onrender.com/

# テスト用アカウント
+ Basic認証ユーザー名: root

+ Basic認証パスワード: 8787

+ メールアドレス（読書投稿・古本出品用）: test@test.com

+ パスワード: 111111q

+ メールアドレス（古本購入用）: test2@test2.com

+ パスワード: 111111q

# 利用方法

## 読書投稿
1. トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う
2. 読書投稿ボタンを押し、検索画面へ遷移。タイトルを入力し、検索結果から該当の本を選択する
3. 書影・タイトル・ISBN・著者・出版社は自動で入力されるので、残りの読書状況・読書レビューを入力し投稿する

## 古本出品
1. 一覧ページから古本出品ボタンを押し、画像ファイルと必要事項を入力し、出品する

## 古本購入
1. 一覧ページから他のアカウントで出品された古本を選択
2. テスト用のクレジットカード情報を入力
   
   カード番号: 4242424242424242
   
   有効期限: 333
   
   cvc: 123
3. 住所情報を入力し、購入ボタンを押す 

## マイページ
1. 一覧ページから投稿者名をクリック。３つのタブを切り替えることで、自身の読書投稿（既読）、読書投稿（未読）、古本出品を管理できる

# アプリケーションを作成した背景
自分の経験と家族・ネットの情報収集から「読まない本（積読本）がたまってしまう」という課題が判明した。課題と他の読書アプリを分析した結果、読書状況の管理および読書習慣の継続だけでは根本的な解決にならないと感じた。一つのアプリの中で、読書管理と古本出品ができることで、課題を解決に導くと判断し、本アプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1NWwzEtkrGUgXfKbkrtg8B_8T6qD7lQ-Syg90AJ9f-EY/edit#gid=1785908763

# 実装した機能についての画像やGIFおよびその説明
[![Image from Gyazo](https://i.gyazo.com/40fc5f30eeeec25324c8dabf1581fc49.gif)](https://gyazo.com/40fc5f30eeeec25324c8dabf1581fc49)

[![Image from Gyazo](https://i.gyazo.com/2cc0a53397282e6b7f78db9f01aabbe4.gif)](https://gyazo.com/2cc0a53397282e6b7f78db9f01aabbe4)

[![Image from Gyazo](https://i.gyazo.com/fbaade08b43a90d3e6028f69c5e4271e.gif)](https://gyazo.com/fbaade08b43a90d3e6028f69c5e4271e)

# 実装予定の機能
今後は、タブで管理するマイページ機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/0f46a4ccb58135e0bf8c6ae91c2d42ac.png)](https://gyazo.com/0f46a4ccb58135e0bf8c6ae91c2d42ac)

# 画面遷移図	
[![Image from Gyazo](https://i.gyazo.com/2a3d06bacf7d97bfc53b3bcd59e468e9.png)](https://gyazo.com/2a3d06bacf7d97bfc53b3bcd59e468e9)

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
| isbn               | string     | null: false                    |
| title              | string     |                                |
| author             | string     |                                |
| publisher          | string     |                                |
| image_url          | string     |                                |
| item_url           | string     |                                |
| read_status_id     | integer    | null: false                    |
| book_review        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## old_booksテーブル

| Column               | Type       | Options                        |
| ------------------   | ---------- | ------------------------------ |
| old_title            | string     | null: false                    |
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