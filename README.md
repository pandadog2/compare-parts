# CompareParts
[![Image from Gyazo](https://i.gyazo.com/fc718577661b1c181c84ba5c5d22f07d.jpg)](https://gyazo.com/fc718577661b1c181c84ba5c5d22f07d)  
# 概要
車の部品情報を登録・検索・比較できるアプリです。  
  
## ペルソナ  
- 自動車会社で働いている20〜30代サラリーマン  
- 打ち合わせが多く、自席に座る時間もないほど忙しい  
- 部品の設計を依頼する際に、過去の部品情報をシステムで検索して参考にしている  
- 部品情報は一件ずつしか見られないため、比較するために印刷をすることもあり、とても不便に感じている  
## このアプリ作製の動機  
以前働いていた部署で実際に上記のことで困っていたため、解決するためにはどのような機能が必要なのか考え、作製しました。  
## 課題解決  
部品情報を一画面で比較できる  
# 利用方法
## 本番環境
[http://www.hellobambi.net](http://www.hellobambi.net "CompareParts")  
  
## ログイン用データ
- 登録用アカウント
email: test1@com  
password: pass11

- 閲覧用アカウント
email： test2@com  
password: pass22  

# DEMO
## 車種登録
[![Image from Gyazo](https://i.gyazo.com/083a11571b490a4796e6853570429683.gif)](https://gyazo.com/083a11571b490a4796e6853570429683)  
新車種の開発が決まったら車種コードを登録します。  

## 部品登録
[![Image from Gyazo](https://i.gyazo.com/e96c71e38f1b1e200dbc2fe25fb69c48.gif)](https://gyazo.com/e96c71e38f1b1e200dbc2fe25fb69c48)  
車種を選択後、以下の項目を登録できます  
図面：png,jpg,jpeg形式 1枚につき2MB以内 最大5枚  
部品名：選択式  
品番：5桁-5桁 （例）12345-67890  
材質：選択式  
板厚(mm)：2桁.2桁 （例）10.55  
質量(g)：5桁.2桁 (例)99999.99  
仕入先：選択式  
承認日：選択式  
参考部品：選択式  

## 部品編集・削除
[![Image from Gyazo](https://i.gyazo.com/ce31fe25ae3e7725dbc8db071882a684.gif)](https://gyazo.com/ce31fe25ae3e7725dbc8db071882a684)  
[![Image from Gyazo](https://i.gyazo.com/bc6ee8350cecc905777b4ca01d06971b.gif)](https://gyazo.com/bc6ee8350cecc905777b4ca01d06971b)  
部品登録したユーザーとログイン中のユーザーが同じ場合のみ編集・削除ができます。  

## 部品検索
[![Image from Gyazo](https://i.gyazo.com/6eecb8df97fda72b82771061f0e05061.gif)](https://gyazo.com/6eecb8df97fda72b82771061f0e05061)  
検索条件を選択して検索できます。  
検索結果が1件なら詳細画面、2件以上なら検索結果画面に遷移します。  
品番は一意なので、品番を指定すれば簡単に目的の図面を検索できます。  

## 部品比較
[![Image from Gyazo](https://i.gyazo.com/a378762361faf4a7cd7e3c2847474e1e.gif)](https://gyazo.com/a378762361faf4a7cd7e3c2847474e1e)  
比較したい部品同士が一致する検索条件を選択すると比較ができます。  
検索結果の右上の×ボタンを押すと、不要な部品情報を非表示にできます。  
検索結果が1件の場合は詳細ページへ遷移します。検索結果を変えて検索し直してください。  
  
※TOPへ戻るときはヘッダーの"CompareParts"をクリックしてください。  
※ページをリセットしたいときはリロードしてください。  

# 工夫したポイント
- 不要な情報は非表示  
余計な情報が出ないように、トップページのアコーディオンを１つ開いたら他は閉じるようにしました。  
- 最短で目的の部品情報を表示  
手間を省くために検索結果の数で遷移先を変えました。  
- 比較のしやすさを追求  
比較したい部品情報が隣同士にできるように、不要な情報を非表示にできるようにしました。  
図面が複数枚あっても比較できるように、検索結果画面にもスライダーを実装しました。その際、自分のペースで比較できるように敢えて手動にしました。  
- 部品誤削除防止  
登録した本人にしか編集・削除ボタンが表示されないようにし、削除ボタンを押したらアラートが表示されるようにしました。  

# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rails
## フロントエンド
JavaScript, JQuery
## データベース
MySOL, SequelPro
## インフラ
AWS(EC2), Capistrano
## Webサーバ（本番環境）
nginx
## アプリケーションサーバ（本番環境）
unicorn
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode
# 課題や今後実装したい機能
### 課題
- 検索メニューと検索結果の画面は同じ方が使い勝手がいいかもしれないと思いました。  
### 今後実装したい機能
- 部品登録・編集時の、図面のプレビュー表示に削除ボタンを実装したいです。  
- 参考元と参考先の部品の比較機能を実装したいです。  
# 要件定義
[![Image from Gyazo](https://i.gyazo.com/9df8254523908f404b89fb742a605155.png)](https://gyazo.com/9df8254523908f404b89fb742a605155)  
# ER図
[![Image from Gyazo](https://i.gyazo.com/0cf0b003d1f01f662be2e039352fd34c.png)](https://gyazo.com/0cf0b003d1f01f662be2e039352fd34c)  
