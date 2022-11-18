class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
      if @bookmark.save
        redirect_to list_path(params[:list_id])
      else
        render 'bookmarks/new', status: :unprocessable_entity
      end
    end

  def destroy
    @bookmark.destroy
    redirect_to lists_url, notice: "Movie was successfully deleted."
  end

  private

    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end

  end


  #  def create
  #   @garden = Garden.new(garden_params)

  #   if @garden.save
  #     redirect_to @garden, notice: "Garden was successfully created."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end
  # def destroy
  #   @movie = Plant.find(params[:id])
  #   @plant.destroy
  #   redirect_to garden_path(@plant.garden)
  # end

  # def movie_params
  #   params.require(:movie).permit(:title, :rating, :overview, :poster_url)
  # end
