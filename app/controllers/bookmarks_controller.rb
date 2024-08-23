class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def index
    @bookmarks = Bookmark.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, staus: :unprocessabe_entity
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
