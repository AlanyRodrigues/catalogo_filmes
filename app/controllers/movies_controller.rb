class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :create_comment]
  before_action :authenticate_user!, except: [:index, :show]

  # Listar filmes
  def index
  @query = params[:query]
  @category = params[:category]

  @movies = Movie.all

  # Filtro de busca
  if @query.present?
    @movies = @movies.where(
      "title ILIKE :q OR director ILIKE :q OR CAST(year AS TEXT) ILIKE :q",
      q: "%#{@query}%"
    )
  end

  # Filtro por categoria
  if @category.present? && @category != ""
    @movies = @movies.where(category: @category)
  end

  # Paginação
  @movies = @movies.page(params[:page]).per(6)
end

  # Mostrar filme
  def show
    @movie = Movie.find(params[:id])
    @comment = Comment.new
    @comments = @movie.comments.includes(:user).order(created_at: :desc)
  end

  # Novo filme
  def new
    @movie = current_user.movies.build
  end

  # Criar filme
  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Filme criado com sucesso!"
    else
      render :new
    end
  end

  # Editar filme existente
  def edit
  end

  # Atualizar filme
  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Filme atualizado com sucesso!"
    else
      render :edit
    end
  end

  # Remover filme
  def destroy
    @movie.destroy
    redirect_to movies_path, notice: "Filme removido com sucesso!"
  end

  # Criar comentário
  def create_comment
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "Você precisa estar logado para comentar."
      return
    end
  
  @comments = @movie.comments.includes(:user).order(created_at: :desc)
  @movie = Movie.find(params[:id])
  @comment = @movie.comments.build(comment_params)
  @comment.user = current_user   # garante que o comentário terá usuário
  if @comment.save
    redirect_to @movie, notice: "Comentário adicionado!"
  else
    redirect_to @movie, alert: "Erro ao adicionar comentário."
  end
end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :year, :duration, :director, :category)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
