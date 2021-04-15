class StocksController < ApplicationController
before_action :set_stock, only: [:show, :edit, :update, :destroy]
# device ログインユーザーのみがストック投稿
before_action :authenticate_user!

  def index
    @q = Stock.ransack(params[:q])
    @stocks = @q.result.includes(:user).page(params[:page]) # 検索結果(検索しなければ全件取得)
    # @stocks = @q.result(distinct: true)
    # @stocks = Stock.all.order(number_of_stock: :asc)
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = current_user.stocks.build(stock_params)

  # @stock = Stock.new(stock_params)
  #現在ログインしているuserのidを、stockのuser_idカラムに挿入する
  # @stock.user_id = current_user.id
  if params[:back]
      render :new
    elsif @stock.save
     # 追記 投稿後メール送信
     # stockMailer.stock_mail(@stock).deliver
     redirect_to stocks_path, notice: "ストックを作成しました！"
     else
     render :new
     end
  end

  def show
  # @stock = Stock.find(params[:id])
  end

  def edit
  # @stock = Stock.find(params[:id])
  end

  def update
   # @stock = Stock.find(params[:id])
   if @stock.update(stock_params)
     redirect_to stocks_path, notice: "ストックを編集しました！"
   elsif
     render :edit
   end
  end
  
  def destroy
    @stock.destroy
    redirect_to stocks_path, notice:"ストックを削除しました！"
  end

  def confirm
    @stock = current_user.stocks.build(stock_params)

    # @stock = Stock.new(stock_params)
    #現在ログインしているuserのidを、stockのuser_idカラムに挿入する
    # @stock.user_id = current_user.id
    render :new if @stock.invalid?
  end

  private
    def stock_params  #:image_cache
     params.require(:stock).permit(:item_genre, :item_name, :content, :price, :image, :image_cache , :number_of_stock)
     .merge(item_genre: params[:stock][:item_genre].to_i)
   end
   def set_stock
    @stock = Stock.find(params[:id])
  end
end
