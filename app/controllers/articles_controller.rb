class ArticlesController < ApplicationController
  #antes de consultar uma action, executar set_article somente...
  before_action :set_article, only: %i[show edit update destroy]
  
  #mostrar todos
  def index
    @articles = Article.all 
  end

  #mostrar um
  def show
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
  end

  def update

    if @article.update(article_params)
      #redireciona para show
      redirect_to @article
    else
      #renderizar a view edit carregando o article
      render :edit
    end

  end

  #deletar
  def destroy
    @article.destroy

    redirect_to root_path
  end

  private

  #params permitidos
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    #buscando artigo por id, repassado por parametro
    @article = Article.find(params[:id])
  end
end
