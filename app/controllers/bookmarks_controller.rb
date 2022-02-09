class BookmarksController < ApplicationController
  before_action :bookmark, only: [:destroy]
 # new
  def new
    @bookmark = Bookmark.new
  end

  #create
  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  # private

  # bookmark is
  def bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # bookmark params

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
