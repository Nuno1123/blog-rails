class CommentsController < ApplicationController
  before_filter :require_login, except: [:create]

  def require_login
    unless current_user
      redirect_to article_path
      flash.notice = "Only logged in user can do such action"
      return false
    end
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end



end
