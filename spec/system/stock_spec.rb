# binding.irb
require 'rails_helper'
RSpec.describe 'ストック管理機能', type: :system do

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

    @stock = FactoryBot.create(:stock)
    @second_stock = FactoryBot.create(:second_stock)
  end

  describe '新規作成機能' do
    context 'ストックの新規作成した場合' do
      it '作成したストックが表示される' do
        visit new_stock_path

        # select '洗濯用品', from: 'item_genre'
        fill_in 'item_name', with: 'test_name'
        fill_in 'content', with: 'content1'
        fill_in 'price', with: '100'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'number_of_stock', with: '1'

        click_on  'Create'
        click_on  '登録する'

        expect(page).to have_content '100'

      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのストック一覧が表示される' do
        visit new_stock_path

        # select '洗濯用品', from: 'item_genre'
        fill_in 'item_name', with: 'test_name'
        fill_in 'content', with: 'content1'
        fill_in 'price', with: '100'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'number_of_stock', with: '1'

        click_on  'Create'
        click_on  '登録する'

        visit new_stock_path

        # select '洗濯用品', from: 'item_genre'
        fill_in 'item_name', with: 'test_name2'
        fill_in 'content', with: 'content2'
        fill_in 'price', with: '120'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'number_of_stock', with: '1'

        click_on  'Create'
        click_on  '登録する'

        expect(page).to have_content 'test_name'
        expect(page).to have_content '1'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のストック詳細画面に遷移した場合' do
       it '該当ストックの内容が表示される' do

       @stock = FactoryBot.create(:stock, item_name: 'test_name')
       visit stock_path(@stock)
       expect(page).to have_content 'test_name'
       end
     end
  end

  describe '検索機能' do
    context '商品名で検索をした場合' do
      it "検索キーワードを含む商品名で絞り込まれる" do

        visit new_stock_path

        # select '洗濯用品', from: 'item_genre'
        fill_in 'item_name', with: 'example1'
        fill_in 'content', with: 'content1'
        fill_in 'price', with: '100'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'number_of_stock', with: '1'

        click_on  'Create'
        click_on  '登録する'
        # visit stocks_path

        visit new_stock_path

        # select '洗濯用品', from: 'item_genre'
        fill_in 'item_name', with: 'test_name2'
        fill_in 'content', with: 'content2'
        fill_in 'price', with: '300'
        # attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"
        fill_in 'number_of_stock', with: '5'

        click_on  'Create'
        click_on  '登録する'

        fill_in 'q_item_name_cont' , with: '2'
        click_on '検索'

        expect(page).to have_content 'test_name2'
        expect(page).not_to have_content 'example1'

      end
    end
  end
end
