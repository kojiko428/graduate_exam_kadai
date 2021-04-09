require 'rails_helper'

RSpec.describe 'ストックモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        stock = Stock.new(item_name: '', content: '失敗テスト')
        expect(stock).not_to be_valid
      end
    end


    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        stock = Stock.new(item_name: '失敗テスト', content: '')
        expect(stock).not_to be_valid
      end
    end

    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        stock = Stock.new(item_name: '成功テスト', content: '成功テスト')
        expect(stock).to be_valid

      end
    end
  end
end