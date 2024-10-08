class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to lists_path, status: :see_other
  end
end
