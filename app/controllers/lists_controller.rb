class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully added.'
    else
      render 'lists/show'
    end
  end

  def destroy
      @list.destroy
      redirect_to lists_url, notice: 'List was successfully destroyed.'
  end


    def set_list
      @list = List.find(params[:id])
    end


  def index
    @lists = List.all
  end

  def show
    set_list
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to lists_path, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully destroyed.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
