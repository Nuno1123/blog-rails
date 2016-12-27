class ArticlesController < ApplicationController

  #routes.rb redirects the GET by the browser to this method which displays all
  #articles
  def index
  @articles = Article.all  #@ before a variable indicates it is an instance variable, can be access from outside
  end

  #when we click an article link (title) it show be directed to the article which
  #is what this method does
  def show
    @article = Article.find(params[:id])

  end

end
