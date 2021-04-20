class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  #(ApplicationController)ログインユーザーが別ユーザーのマイページに行かないよう制限
  before_action :correct_user,only:[:show]
  # マイページ
  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
    params.fetch(:user, {}).permit(:username, :password, :image, :image_cache)
    end

end
