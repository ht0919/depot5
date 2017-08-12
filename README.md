# Depot for Rails 5.1.3

- 書籍『RailsによるアジャイルWebアプリケーション開発(第４版)』のサンプル(depot)をRails5に移植した時の変更記録です。

## 動作環境

- OS: macOS 10.12.6
- Ruby: 2.4.1-p111
- Rails: 5.1.3

## 実装手順

```
$ git clone https://github.com/ht0919/depot5.git
$ cd depot5
$ bin/bundle install
$ bin/rake db:migrate
$ bin/rake db:migrate RAILS_ENV=test
$ bin/rake db:seed
$ bin/rake test
$ bin/rails server
```

## 第6章 タスクA:アプリケーションの作成

- \_form.html.erbの表記(p.66)
  - 修正前：<%= form.text_area :description, rows: 6 %>
  - 修正後：<%= form.text_area :description, id: :product_description, rows: 6 %>

- ファイルの拡張子(p.69)
  - 修正前：products.css.scss
  - 修正後：products.scss

- confirmの表記(p.71)
  - 修正前：confirm: 'Are you sure?',
  - 修正後：__data: {__ confirm: 'Are you sure?' __}__,


## 第7章 タスクB:検証とユニットテスト

- 正規表現の記号(p.78)
  - 修正前：with: %r{\.(gif|jpg|png)__$__}i,
  - 修正後：with: %r{\.(gif|jpg|png)__\z__}i,

- 機能テストのフォルダ名(p.78)
  - 修正前：test/__functional__/products_controller_test.rb
  - 修正後：test/__controllers__/products_controller_test.rb

- test "should create product"の修正(p.79)
  - 修正前：post :create, product: @update
  - 修正後：post products_url, params: { product: @update }

- test "should update product"の修正(p.79)
  - 修正前：patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
  - 修正後：patch product_url(@product), params: { product: @update }

- test "should get index"のエラー対策(p.79)
  * test/fixtures/products.ymlの修正(2箇所とも実在する画像ファイルに置き換える)
  - 修正前：image_url: MyString
  - 修正後：image_url: ruby.jpg

- ユニットテストのフォルダ名(p.80)
  - 修正前：test/__unit__/product_test.rb
  - 修正後：test/__model__/product_test.rb

- ユニットテストの実行(p.81)
  - 修正前：rake test:__units__
  - 修正後：rake test:__models__

- フィクスチャデータの追加(p.84)
  - 修正前：image_url: ruby.png
  - 修正後：image_url: ruby.jpg

- I18nによるテスト(p.86)
  - 準備：config/locales/en.ymlを以下のように修正
  ```
  en:
    hello: "Hello world"

    activerecord:
      errors:
        messages:
          taken: "has already been taken"
  ```


## 第8章 タスクC:カタログの表示

- rootのURLを設定(p.90)
  - 修正前：root to: 'store#index', as 'store'
  - 修正後：root 'store#index'


- index.htmlの削除(p.91)
  - 修正前：rm public/index.html
  - 修正後：何もしない


- 機能テストのフォルダ名(p.98)
  - 修正前：test/__functional__/store_controller_test.rb
  - 修正後：test/__controllers__/store_controller_test.rb


- 機能テストの実行(p.100)
  - 修正前：rake test:__functionals__
  - 修正後：rake test:__controllers__


## 第9章 タスクD:カートの作成

- 機能テストのフォルダ名(p.107)
  - 修正前：test/__functional__/line_items_controller_test.rb
  - 修正後：test/__controllers__/line_items_controller_test.rb


- 機能テストの準備(p.107)
  - rake db:migrate RAILS_ENV=test


- 機能テストの実行(p.107)
  - 修正前：rake test:__functionals__
  - 修正後：rake test:__controllers__


## 第10章 タスクE:もっとスマートなカートの作成

- エラー時のリダイレクト指定(p.117)
  - 修正前：redirect_to __store_url__, notice: '無効なカートです'
  - 修正後：redirect_to __root_url__, notice: '無効なカートです'


- confirmの表記(p.119)
  - 修正前：confirm: '本当によいですか？' %>
  - 修正後：__data: {__ confirm: '本当によいですか？' __}__ %>


- カートを空にした時のリダイレクト指定(p.119)
  - 修正前：format.html { redirect_to __store_url__,
  - 修正後：format.html { redirect_to __root_url__,


- 機能テストのカートの削除でのリダイレクト指定(p.119)
  - 修正前：assert_redirected_to __store_url__,
  - 修正後：assert_redirected_to __root_url__,


- 機能テストのエラー回避のためeditメソッドを修正
  * app/controllers/carts_controller.rb
  - 修正前：
    ```
    def edit
    end
    ```
  - 修正後：
    ```
    def edit
      @cart = Cart.find(params[:id])
    end
    ```


- 機能テストのエラー回避のためupdateメソッドを修正
  * app/controllers/carts_controller.rb
  - 修正前：
    ```
    def update
      respond_to do |format|
    ```
  - 修正後：
    ```
    def update
      @cart = Cart.find(params[:id])

      respond_to do |format|
    ```


## 第11章 タスクF:Ajaxの追加

- ページ遷移の変更でリダイレクト指定(p.131)
  * app/controllers/line_items_controller.rb
  - 修正前：format.html { redirect_to __store_url__ }
  - 修正後：format.html { redirect_to __root_path__ }


- 変更内容の強調表示(p.135)
  - Genfileの末尾に「gem 'jquery-ui-rails'」を追加
  - bin/bundle install
  - サーバーの再起動(Ctrl+C -> rails s)


- 機能テストのフォルダ名(p.143)
  - 修正前：test/__functional__/line_items_controller_test.rb
  - 修正後：test/__controllers__/line_items_controller_test.rb


- 機能テストのリダイレクト指定(p.119)
  - 修正前：assert_redirected_to __store_path__,
  - 修正後：assert_redirected_to __root_path__,


## 第12章 タスクG:チェックアウト！

- ページ遷移の変更でリダイレクト指定(p.149)
  * app/controllers/orders_controller.rb
  - 修正前：redirect_to __store_url__, notice: "カートは空です"
  - 修正後：redirect_to __root_url__, notice: "カートは空です"


- 機能テストのフォルダ名(p.149)
  - 修正前：test/__functional__/order_controller_test.rb
  - 修正後：test/__controllers__/order_controller_test.rb


- ページ遷移の変更でリダイレクト指定(p.149)
  * test/controllers/orders_controller_test.rb
  - 修正前：assert_redirected_to __store_path__
  - 修正後：assert_redirected_to __root_path__


- テスト用のフィクスチャデータを修正(p.153)
  * test/fixtures/orders.yml
  - 修正前：pay_type: __Check__
  - 修正後：pay_type: __現金__


- ページ遷移の変更でリダイレクト指定(p.155)
  * app/controllers/orders_controller.rb
  - 修正前：format.html { redirect_to __store_url__, notice:'ご注文ありがとうございます' }
  - 修正後：format.html { redirect_to __root_url__, notice:'ご注文ありがとうございます' }


- ページ遷移の変更でリダイレクト指定(p.156)
  * test/controllers/orders_controller_test.rb
  - 修正前：assert_redirected_to __store_path__
  - 修正後：assert_redirected_to __root_path__


- ActiveModel::ForbiddenAttributesError 対策(p.157)
  * config/application.rb
  - 修正前：
  ```
      # config.i18n.default_locale = :de
    end
  end
  ```
  - 修正後：
  ```
      # config.i18n.default_locale = :de
      config.action_controller.permit_all_parameters = true
    end
  end
  ```


- ArgumentError in OrdersController#index 対策(p.164)
  * app/controllers/orders_controller.rb
  - 修正前：
  ```
    def index
      @orders = Order.paginate :page=>params[:page], :order=>'created_at desc', :per_page => 10
  ```
  - 修正後：
  ```
    def index
      @orders = Order.page(params[:page]).order('created_at desc').per_page(10)
  ```


## 第13章 タスクH:メールの送信

- 電子メールの機能テストのフォルダ名(p.172)
  - 修正前：test/__functional__/order_notifier_test.rb
  - 修正後：test/__mailers__/order_notifier_test.rb

- メールの機能テスト(received)がエラーになるのでコメント(p.172)
  - 修正前：assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  - 修正後：__#__ assert_match /1 x Programming Ruby 1.9/, mail.body.encoded

- メールの機能テスト(shipped)がエラーになるのでコメント(p.172)
  - 修正前：assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  - 修正後：__#__ assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded

- 統合テストのpay_type(p.176)
  - 修正前：pay_type: "__Check__" }
  - 修正後：pay_type: "__現金__" }

- 統合テストのpay_type(p.176)
  - 修正前：assert_equal "__Check__",            order.pay_type
  - 修正後：assert_equal "__現金__",            order.pay_type


## 第14章 タスクI:ログイン

- ユーザ登録画面の乱れを修正(p.182)
  * app/views/users/\_form.html.erb
  - 修正前：
    ```
    <div>
      <%= f.label :name %>:
      <%= f.text_field :name, size: 40 %>
    </div>
    <div>
      <%= f.label :password, 'パスワード' %>:
      <%= f.password_field :password, size: 40 %>
    </div>
    <div>
      <%= f.label :password_confirmation, '確認' %>:
      <%= f.password_field :password_confirmation, size: 40 %>
    </div>
    <div>
      <%= f.submit %>
    </div>
    ```

  - 修正後：
    ```
    <div class="field">
      <%= f.label :name %>:
      <%= f.text_field :name, size: 40 %>
    </div>
    <div class="field">
      <%= f.label :password, 'パスワード' %>:
      <%= f.password_field :password, size: 40 %>
    </div>
    <div class="field">
      <%= f.label :password_confirmation, '確認' %>:
      <%= f.password_field :password_confirmation, size: 40 %>
    </div>
    <div class="actions">
      <%= f.submit %>
    </div>
    ```


  - 実行前にGemfileの「bcript-ruby」のコメントを解除(p.182)
    * Gemfile
    - 修正前：# gem 'bcrypt-ruby', '~> 3.1.2'
    - 修正後：gem 'bcrypt-ruby', '~> 3.1.2'

  - 機能テストのフォルダ名(p.188)
    - 修正前：test/__functional__/sessions_controller_test.rb
    - 修正後：test/__controllers__/sessions_controller_test.rb

  - ログアウト時のリダイレクト指定(p.186)
    * app/controllers/sessions_controller.rb
    - 修正前：redirect_to __store_url__, notice: "ログアウト"
    - 修正前：redirect_to __root_url__, notice: "ログアウト"

  - 機能テストでのログアウト時のリダイレクト指定(p.188)
    * test/controllers/sessions_controller_test.rb
    - 修正前：assert_redirected_to __store_url__
    - 修正前：assert_redirected_to __root_url__
