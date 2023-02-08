class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  # params not working yet
  def bookmark_params
    params.require(:bookmark).permit(:comment, movies_attributes: [:id, :title, :overview, :poster_url, :rating])
  end
end
