class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    keyword = params[:keyword]
    @movies = @movies.where("title LIKE :s OR director LIKE :s", s: "%#{keyword}%") if keyword
    case params[:time_scope].to_i
    when 1
      @movies = @movies.under_90
    when 2
      @movies = @movies.between_90_and_120
    when 3
      @movies = @movies.over_120
    else
      @movies
    end

  end

  def show
    @movie = Movie.find params[:id]
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def create
    @movie = Movie.new movie_params
    
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find params[:id]

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
    )
  end

end
