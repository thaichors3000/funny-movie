class MoviesController < ApplicationController
  before_action :require_authenticate!

  def new
    @movie = Movie.new
  end

  def create
    @movie = current_user.movies.build(movie_params)

    if @movie.save
      flash[:success] = 'Share successfully'

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url)
  end
end
