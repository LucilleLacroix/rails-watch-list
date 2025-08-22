class MoviesController < ApplicationController
  before_action :set_list

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      @list.movies << @movie
      redirect_to @list, notice: "Movie added!"
    else
      render :new
    end
  end

  def destroy
    movie = @list.movies.find(params[:id])
    @list.movies.destroy(movie)
    redirect_to @list, notice: "Movie removed from list"
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end
end
