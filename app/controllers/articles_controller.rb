class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    puts "---------- #{params} ---------------"
    @article = Article.find(params[:id])
    #@article = Article.find_by(title: params[:gruszka])
  end
  
  def new
    @article = Article.new
  end

  def create
    #@article = Article.new(title: article_params["title"], body: article_params["body"])
    @article = Article.new(article_params)

    #debugger

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end