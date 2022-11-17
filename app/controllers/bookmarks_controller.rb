class BookmarksController < ApplicationController
  def create
    @plant = Movie.new(movie_params)
    @list = List.find(params[:list_id])
    @movie.list = @list

    if @movie.save
      redirect_to list_path(@movie.list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  # def destroy
  #   @movie = Plant.find(params[:id])
  #   @plant.destroy
  #   redirect_to garden_path(@plant.garden)
  # end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :overview, :poster_url)
  end
end
