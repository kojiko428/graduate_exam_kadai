require 'rails_helper'

RSpec.describe 'ユーザーモデル機能', type: :model do

  describe 'バリデーションのテスト' do
    context 'ユーザーのemailが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(username: 'user1', email: '',
                        password: 'password1', password_confirmation: 'password1')
        expect(user).not_to be_valid
      end
    end

    context 'ユーザーのpasswordが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(username: 'user1', email: 'user1@example.com',
                        password: '', password_confirmation: '')
        expect(user).not_to be_valid
      end
    end

    context 'ユーザーのemail・passwordが記載されている場合' do
      it 'バリデーションが通る' do
        user = User.new(username: 'user1', email: 'user1@example.com',
                        password: 'password1', password_confirmation: 'password1')
        expect(user).to be_valid
      end
    end
  end
end
