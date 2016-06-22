class PhotosController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :get_album

  def index
    redirect_to album_path(@album.id)
  end

  def show
    @photo = Photo.where(id: params[:id]).where(album_id: params[:album_id]).first
    if @photo.present?
      render template: "photos/show"
    else
      @message = 'Photo not found'
      render template: "albums/notice", status: 404
    end
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.where(id: params[:id]).where(album_id: params[:album_id]).first
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      @message = "Photo created"
      respond_to do |format|
        format.html { redirect_to album_path(@photo.album_id), notice: @message }
        format.json { render template: "albums/show", notice: @message }
      end
    else
      @message = @photo.errors
      respond_to do |format|
        format.html { render :new }
        format.json { render template: "albums/notice", status: 400 }
      end
    end
  end

  def multiple
    count = 0
    params[:photos].each do |photo|
      photo = photo[1]
      @photo = Photo.create(
        album_id: params[:album_id].present? ? params[:album_id] : '',
        name: photo[:name].present? ? photo[:name] : '',
        description: photo[:description].present? ? photo[:description] : '',
        url: photo[:url].present? ? photo[:url] : '',
        taken_at: photo[:taken_at].present? ? photo[:taken_at] : ''
      )
      if @photo.save
        count = count + 1
      end
    end
    @message = count.to_s+' photos created'
    respond_to do |format|
      format.html { redirect_to album_path(params[:album_id]), notice: @message }
      format.json { render template: "albums/notice" }
    end
  end

  def update
    @photo = Photo.where(id: params[:id]).where(album_id: params[:album_id]).first
    if @photo.update(photo_params)
      @message = "Photo updated"
      respond_to do |format|
        format.html { redirect_to album_path(@photo.album_id), notice: @message }
        format.json { render template: "photos/show" }
      end
    else
      @message = @photo.errors
      respond_to do |format|
        format.html { render :edit }
        format.json { render template: "albums/notice", status: 400 }
      end
    end
  end

  def destroy
    @photo = Photo.where(id: params[:id]).where(album_id: params[:album_id]).first
    if @photo.destroy
      @message = "Photo deleted"
      respond_to do |format|
        format.html { redirect_to album_path(@photo.album_id), notice: "Photo deleted" }
        format.json { render template: "albums/notice" }
      end
    else
      respond_to do |format|
        format.html { redirect_to album_path(@photo.album_id), alert: "Error deleting photo" }
        format.json {
          @message = @photo.errors
          render template: "albums/notice", status: 400
        }
      end

    end
  end

  private

  def get_album
    @album = Album.find(params[:album_id])
  end

  def photo_params
    params.require(:photo).permit(:album_id, :name, :description, :url, :taken_at)
  end

end
