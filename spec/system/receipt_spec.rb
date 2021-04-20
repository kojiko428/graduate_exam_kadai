# binding.irb
require 'rails_helper'
RSpec.describe 'レシート管理機能', type: :system do

# ユーザー作成・ログイン
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:second_user)

    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    click_on "sign-in-submit"

    # FactoryBot.create(:stock, user: @user)
    # FactoryBot.create(:second_stock, user: @user)
    # visit stocks_path

  end

  describe '新規作成機能' do
    context 'レシートの新規作成した場合' do
      it '作成したレシートが表示される' do
        visit new_receipt_path

        fill_in 'shop_name', with: 'test_shop_name'
        fill_in 'item_detail', with: 'test_item_1'
        fill_in 'price', with: '100'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'memo', with: 'test_memo1'

        click_on  'Create'

        expect(page).to have_content 'test_memo1'

      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのレシート一覧が表示される' do
        visit new_receipt_path

        fill_in 'shop_name', with: 'test_shop_name'
        fill_in 'item_detail', with: 'test_item_1'
        fill_in 'price', with: '100'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'memo', with: 'test_memo1'

        click_on  'Create'

        visit new_receipt_path

        fill_in 'shop_name', with: 'test_shop_name2'
        fill_in 'item_detail', with: 'test_item_2'
        fill_in 'price', with: '120'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'memo', with: 'test_memo2'

        click_on  'Create'

        expect(page).to have_content 'test_memo2'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のストック詳細画面に遷移した場合' do
       it '該当ストックの内容が表示される' do

       @receipt = FactoryBot.create(:receipt, shop_name: 'test_shop_name')
       visit receipt_path(@receipt)
       expect(page).to have_content 'test_shop_name'

       end
     end
  end

  describe 'メモへのコメント' do
    context 'レシートの詳細画面' do
      it 'メモにコメントできる' do

        @receipt = FactoryBot.create(:receipt, shop_name: 'test_shop_name')
        visit receipt_path(@receipt)

        fill_in 'comment_content', with: 'comment'
        # 変更：comment/_form.html.erb
        click_on "コメント投稿"
        expect(page).to have_content 'comment'
      end
    end
  end
end
