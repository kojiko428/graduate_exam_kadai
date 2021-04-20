require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do

  # let!(:user){ FactoryBot.create(:user) }
  # let!(:second_user){ FactoryBot.create(:second_user) }

  describe 'ユーザー登録のテスト' do
    context 'ユーザーを新規作成した場合' do

      it '作成したユーザーが表示される' do
        # 新規登録画面
        visit new_user_registration_path
        # binding.pry
        fill_in 'user_username', with: 'test1'
        fill_in 'user_email', with: '111111@test.com'
        fill_in 'user_password', with: '11111111'
        fill_in 'user_password_confirmation', with: '11111111'
        attach_file "user[image]", "#{Rails.root}/spec/fixtures/test.jpg"

        click_on 'sign-up-submit'
        expect(page).to have_content 'test1'
      end

      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit stocks_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'セッション機能テスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
    end

    context "ログインしていない状態でユーザデータがある場合" do
      it 'ログインができること' do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password

        click_on "sign-in-submit"
        expect(current_path).to eq user_path(id: @user.id)
      end
    end

    context 'ログインしている場合' do
      before do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password

        click_on "sign-in-submit"
      end
  #
      it '自分のマイページに飛べること' do
        visit user_path(id: @user.id)
        expect(current_path).to eq user_path(id: @user.id)
      end

      it "他人の詳細画面に飛ぶとトップページに遷移すること" do
        visit user_path(@second_user.id)
        expect(page).to have_content "トップページ"
      end

      it "ログイン画面に戻る" do
        visit user_path(id: @user.id)
        click_link "ログアウト"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end
