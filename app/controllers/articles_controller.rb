class ArticlesController < ApplicationController
  #antes de consultar uma action, executar set_article somente...
  before_action :set_article, only: %i[show edit update destroy]
  
  #mostrar todos
  def index

    #ultimos 3 adicionados decrescentes
    @highlights = Article.desc_order.first(3)

    #page corrente vai ser um parametro ou 1
    current_page = (params[:page] || 1).to_i

    #id dos ultimos 3 add
    highlights_ids = @highlights.pluck(:id).join(',')

    #paginacao com kaminari ordenado pelo campo created_at decrescente - os @highlights
    @articles = Article.without_highlights(highlights_ids)
                       .desc_order
                       .page(current_page)
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
      redirect_to @article, notice: "Article was successfully created."
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
      redirect_to @article, notice: "Article was successfully updated."
    else
      #renderizar a view edit carregando o article
      render :edit
    end

  end

  #deletar
  def destroy
    @article.destroy

    redirect_to root_path, notice: "Article was successfully destroyed."
  end

  private

  #params permitidos
  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end

  def set_article
    #buscando artigo por id, repassado por parametro
    @article = Article.find(params[:id])
  end
end