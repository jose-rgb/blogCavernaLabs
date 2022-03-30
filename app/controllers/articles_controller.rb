class ArticlesController < ApplicationController
  include Paginable
  
  #autenticacao devise
  before_action :authenticate_user!, except: %i[index show]

  #antes de consultar uma action, executar set_article somente...
  before_action :set_article, only: %i[show edit update destroy]

  #mostrar todos
  def index
    category = Category.find_by_name(params[:category]) if params[:category].present?

    #ultimos 3 adicionados decrescentes
    @highlights = Article.filter_by_category(category).desc_order.first(3)

    #id dos ultimos 3 add
    highlights_ids = @highlights.pluck(:id).join(',')


    #paginacao com kaminari ordenado pelo campo created_at decrescente - os @highlights
    @articles = Article.without_highlights(highlights_ids)
                       .filter_by_category(category)
                       .desc_order
                       .page(current_page)

    @categories = Category.sorted
  end

  #mostrar um
  def show
  end

  #criar
  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)

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
    authorize @article
  end
end