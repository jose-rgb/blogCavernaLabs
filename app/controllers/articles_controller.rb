class ArticlesController < ApplicationController
  include Paginable
  
  #autenticacao devise
  before_action :authenticate_user!, except: %i[index show]

  #antes de consultar uma action, executar set_article somente...
  before_action :set_article, only: %i[ edit update destroy]
  before_action :set_categories, only: %i[new create edit update]

  #mostrar todos
  def index
    @categories = Category.sorted
    category = @categories.select { |c| c.name == params[:category]}[0] if params[:category].present?

    #ultimos 3 adicionados decrescentes
    @highlights = Article.includes(:category, :user).filter_by_category(category).filter_by_archive(params[:month_year]).desc_order.first(3)

    #id dos ultimos 3 add
    highlights_ids = @highlights.pluck(:id).join(',')


    #paginacao com kaminari ordenado pelo campo created_at decrescente - os @highlights
    @articles = Article.includes(:category, :user)
                       .without_highlights(highlights_ids)
                       .filter_by_category(category)
                       .filter_by_archive(params[:month_year])
                       .desc_order
                       .page(current_page)

    @archives =  Article.group_by_month(:created_at, format: '%B %Y').count
  end

  #mostrar um
  def show
    @article = Article.includes(comments: :user).find(params[:id])
    authorize @article
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

  def set_categories
    @categories = Category.sorted
  end
end