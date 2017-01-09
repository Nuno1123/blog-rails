class TagsController < ApplicationController
  before_filter :require_login, only: [:show, :destroy]

  def require_login
    unless current_user
      redirect_to tags_path
      flash.notice = "Can't do action unless logged in"
      return false
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    tag_name = @tag.name
    @tag.destroy

    flash.notice = "Tag '#{tag_name}' deleted"

    redirect_to tags_path
  end

end
