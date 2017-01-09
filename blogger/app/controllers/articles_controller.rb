class ArticlesController < ApplicationController
  before_filter :require_login, except: [:show, :index]
  include ArticlesHelper


  def require_login
    unless current_user
      redirect_to article_path
      flash.notice = "Unauthorized action for unsuscribed users"
      return false
    end
  end

  #routes.rb redirects the GET by the browser to this method which displays all
  #articles
  def index
    @articles = Article.all  #@ before a variable indicates it is an instance variable, can be access from outside
  end

  #when we click an article link (title) it show be directed to the article which
  #is what this method does
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  #to create a new article when we click the create article link_to
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' created"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    article_title = @article.title
    @article.destroy

    flash.notice = "Article '#{article_title}' deleted"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' updated"

    redirect_to article_path(@article)
  end

end
