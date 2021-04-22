require 'rails_helper'

RSpec.describe Receipt, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
RSpec.describe 'レシートモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'ストックのタイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        stock = user.stocks.build(item_name: '', content: '失敗テスト',
                          price: '100', number_of_stock: '100', user_id: 1  )
        expect(stock).not_to be_valid
      end
    end

    context 'ストックの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        stock = user.stocks.build(item_name: '失敗テスト', content: '',
                          price: '100', number_of_stock: '100', user_id: 1  )
        expect(stock).not_to be_valid
      end
    end

    context 'ストックのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        stock = user.stocks.build(item_name: '成功テスト', content: '成功テスト',
                          price: '100', number_of_stock: '100', user_id: 1  )
        expect(stock).to be_valid
      end
    end
  end
end
