class ArticlesController < ApplicationController
  
  #mostrar todos
  def index
    @articles = Article.all 
  end

  #mostrar um
  def show
    @article = Article.find(params[:id])
  end

  #criar
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      #redireciona para show
      redirect_to @article
    else
      #renderizar a view new carregando o article
      render :new
    end

  end

  #atualizar
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      #redireciona para show
      redirect_to @article
    else
      #renderizar a view edit carregando o article
      render :edit
    end

  end

  private

  #params permitidos
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
