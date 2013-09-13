class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = commentable_record.comments.create(params[:comment])
    @comment.user = current_user #当前用户

    if @comment.save
      redirect_to commentable_record, notice: '创建评论成功'
    else
      redirect_to commentable_record, notice: '创建评论失败'
    end
  end

  def destroy
    @comment = commentable_record.comments.find(params[:id])

    if @comment.user == current_user or current_user.id == 1
      @comment.destroy
    end

    redirect_to commentable_record, :notice => '成功删除评论 '
  end

  protected

  def commentable_record
    Product.find(params[:product_id])
  end

end