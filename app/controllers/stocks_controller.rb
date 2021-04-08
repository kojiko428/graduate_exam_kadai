class StocksController < ApplicationController
before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
  @stocks = Stock.all
  end

  def new
  @stock = Stock.new
  end
  def create
  # @stock = current_user.stocks.build(stock_params)
  @stock = Stock.new(stock_params)
  # @blog.user_id = current_user.id
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
    # @stock = current_user.stocks.build(stock_params)
    @stock = Stock.new(stock_params)
    # @stock.user_id = current_user.id
    render :new if @stock.invalid?
  end

  private
    def stock_params  #:image_cache
     params.require(:stock).permit(:item_genre, :item_name, :content, :price , :image , :number_of_stock)
   end
   def set_stock
    @stock = Stock.find(params[:id])
  end
end
