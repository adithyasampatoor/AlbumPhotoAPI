class AlbumsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @albums = Album.page params[:page]
  end

  def new
    @album = Album.new
  end

  def edit
    @album = Album.includes(:photos).find(params[:id])
  end

  def show
    @album = Album.includes(:photos).where(id: params[:id]).first
    if @album.present?
      render template: "albums/show"
    else
      @message = 'Album not found'
      render template: "albums/notice", status: 404
    end
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      @message = "Album created"
      respond_to do |format|
        format.html { redirect_to album_path(@album.id), notice: @message }
        format.json { render template: "albums/show", notice: @message }
      end
    else
      @message = @album.errors
      respond_to do |format|
        format.html { render :new }
        format.json { render template: "albums/notice", status: 400 }
      end
    end
  end

  def update
    @album = Album.includes(:photos).find(params[:id])
    if @album.update(album_params)
      @message = "Album updated"
      respond_to do |format|
        format.html { redirect_to album_path(@album.id), notice: @message }
        format.json { render template: "albums/show", notice: @message }
      end
    else
      @message = @album.errors
      respond_to do |format|
        format.html { render :edit }
        format.json { render template: "albums/notice", status: 400 }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      respond_to do |format|
        format.html { redirect_to albums_path, notice: "Album deleted" }
        format.json {
          @message = "Album deleted"
          render template: "albums/notice"
        }
      end
    else
      respond_to do |format|
        format.html { redirect_to albums_path, notice: "Error deleting album" }
        format.json {
          @message = @album.errors
          render template: "albums/notice", status: 400
        }
      end
    end
  end

  def notice
    
  end

  private

  def album_params
    params.require(:album).permit(:name, :position)
  end

end
