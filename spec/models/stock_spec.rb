require 'rails_helper'
RSpec.describe 'ストックモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'ストックのアイテム名が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        stock = user.stocks.build(item_genre: '洗濯用品', item_name: '', content: '失敗テスト',
                          price: '100', number_of_stock: '100', user_id: 1  )
        expect(stock).not_to be_valid
      end
    end

    context 'ストックの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        stock = user.stocks.build(item_genre: '洗濯用品', item_name: '失敗テスト', content: '',
                          price: '100', number_of_stock: '100', user_id: 1  )
        expect(stock).not_to be_valid
      end
    end

    context 'ストックのアイテム名と詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        stock = user.stocks.build(item_genre: '洗濯用品', item_name: '成功テスト', content: '成功テスト',
                          price: '100', number_of_stock: '100', user_id: 1  )
        expect(stock).to be_valid
      end
    end
  end
end
