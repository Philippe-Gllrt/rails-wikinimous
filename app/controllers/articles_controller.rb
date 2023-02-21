class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)
    @article.save
    redirect_to article_path(@article)
  end

  def show
    puts params[:id]
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_param)
    redirect_to article_path(@article)

  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to('/articles')
  end

  private

  def article_param
    params.require(:article).permit(:title, :details)
  end
end
