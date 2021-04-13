class CommentsController < ApplicationController
  # コメントを保存、投稿するためのアクションです。
  def create
  # receiptをパラメータの値から探し出し,receiptに紐づくcommentsとしてbuildします。
    @receipt = Receipt.find(params[:receipt_id])
    @comment = @receipt.comments.build(comment_params)
  # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to receipt_path(@receipt) }
      else
        format.html { redirect_to receipt_path(@receipt), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit(:receipt_id, :content)
  end
end
