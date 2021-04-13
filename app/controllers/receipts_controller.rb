class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]
  # device ログインユーザーのみがストック投稿
  before_action :authenticate_user!

  def index
    @receipts = Receipt.all
  end

  def new
    @receipt = Receipt.new
  end

  def create
    @receipt = current_user.receipts.build(receipt_params)

    # @receipt = Receipt.new(receipt_params)
    #現在ログインしているuserのidを、receiptのuser_idカラムに挿入する
    # @receipt.user_id = current_user.id
    if params[:back]
        render :new
    elsif @receipt.save
       # 追記 投稿後メール送信
       # receiptMailer.receipt_mail(@receipt).deliver
      redirect_to receipts_path, notice: "レシートを作成しました！"
    else
      render :new
    end
  end

  def show
    # @receipt = Receipt.find(params[:id])
  end

  def edit
    # @receipt = Receipt.find(params[:id])
  end

  def update
     # @receipt = Receipt.find(params[:id])
    if @receipt.update(receipt_params)
      redirect_to receipts_path, notice: "レシートを編集しました！"
    elsif
      render :edit
    end
  end

  def destroy
    @receipt.destroy
    redirect_to receipts_path, notice:"レシートを削除しました！"
  end

  def confirm
    @receipt = current_user.receipts.build(receipt_params)

    # @receipt = Receipt.new(receipt_params)
    #現在ログインしているuserのidを、receiptのuser_idカラムに挿入する
    # @receipt.user_id = current_user.id
    render :new if @receipt.invalid?
  end

  private
    def receipt_params  #:image_cache
       params.require(:receipt).permit(:shop_name, :item_detail, :memo, :price, :image, :image_cache )
    end

    def set_receipt
      @receipt = Receipt.find(params[:id])
    end
end
