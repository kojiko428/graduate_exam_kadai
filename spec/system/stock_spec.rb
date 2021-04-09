require 'rails_helper'
RSpec.describe 'ストック管理機能', type: :system do
  before do
  end

  describe '新規作成機能' do
    context 'ストックを新規作成した場合' do
      it '作成したストックが表示される' do

        stock = FactoryBot.create(:stock, item_genre: 'test_genre' )
        visit stocks_path
        expect(page).to have_content 'test_genre'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのストック一覧が表示される' do

        stock = FactoryBot.create(:stock, item_genre: 'test_genre' )
        stock = FactoryBot.create(:second_stock, item_genre: 'test_genre2' )
        visit stocks_path
        expect(page).to have_content 'test_genre2'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のストック詳細画面に遷移した場合' do
       it '該当ストックの内容が表示される' do

       @stock = FactoryBot.create(:stock, item_genre: 'test_genre')
       visit stock_path(@stock)
       expect(page).to have_content 'test_genre'

       end
     end
  end
end
