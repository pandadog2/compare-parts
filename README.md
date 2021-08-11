#CompareParts
[![Image from Gyazo](https://i.gyazo.com/2a6c09d5296a39d74f8740039e1533a9.jpg)](https://gyazo.com/2a6c09d5296a39d74f8740039e1533a9)##概要
車の部品の図面登録・検索・比較ができるアプリです。

##利用方法
###ログイン用データ
ユーザー1
email: test1@com
password: pass11

ユーザー2
email： test2@com
password: pass22

###車種登録
新車種の開発が決まったら車種コードを登録します。
編集・削除はできないので間違えずに入力してください。

###部品登録
以下の条件で登録できます
図面：png,jpg,jpeg形式 1枚につき2MB以内 最大5枚
部品名：選択式
品番：5桁-5桁 （例）12345-67890
材質：選択式
板厚(mm)：2桁.2桁 （例）10.55
質量(g)：5桁.2桁 (例)99999.99
仕入先：選択式

###部品編集・削除
部品登録したユーザーとログイン中のユーザーが同じ場合のみ編集・削除ができます。
※画像の編集機能は開発中のため、現在ご利用いただけません。

###部品検索
検索条件を選択して検索できます。
品番は一意なので、簡単に目的の図面を検索できます。

###部品比較
比較したい部品同士が一致する検索条件を選択すると比較ができます。
検索結果の右上の×ボタンを押すと、不要な部品情報を非表示にできます。
検索結果を誤って非表示にしてしまった時はリロードすると元に戻ります。
検索結果が1件の場合は詳細ページへ遷移します。検索結果を変えて検索し直してください。

## テーブル設計
### users テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
Association
- has_many :car_models
- has_many :parts

### car_types テーブル
| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| car_model_code | string | null: false |
Association
- belongs_to :user
- has_many :parts

### parts テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product_number  | string     | null: false                    |
| material_id     | integer    | null: false                    |
| thickness       | string     | null: false                    |
| weight          | string     | null: false                    |
| supplier_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| car_model_code  | references | null: false, foreign_key: true | 
Association
- belongs_to :user
- belongs_to :car_model
