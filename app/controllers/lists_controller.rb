class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  def index
    @lists = List.all
  end

  def show
    @bookmark = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @lists = List.new
  end

  def edit
  end

  def create
    @lists = List.new(list_params)

    if @lists.save
      redirect_to @lists, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @lists.update(list_params)
      redirect_to @list, notice: "List was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lists.destroy
    redirect_to lists_url, notice: "List was successfully deleted."
  end

  private
    def set_list
      @lists = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
