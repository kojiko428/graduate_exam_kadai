require 'rails_helper'

RSpec.describe 'レシートモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'レシートのが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        receipt = user.receipts.build(shop_name: '', item_detail: '失敗テスト',
                                      price: '100', user_id: 1  )
        expect(receipt).not_to be_valid
      end
    end

    context 'レシートの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        receipt = user.receipts.build(shop_name: '失敗テスト', item_detail: '',
                                      price: '100', user_id: 1  )
        expect(receipt).not_to be_valid
      end
    end

    context 'レシートのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        receipt = user.receipts.build(shop_name: '成功テスト', item_detail: '成功テスト',
                                      price: '100', user_id: 1 )
        expect(receipt).to be_valid
      end
    end
  end
end
