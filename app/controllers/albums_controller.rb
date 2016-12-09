class AlbumsController < ApplicationController
  before_action :require_log_in

  def show
    @album = Album.find_by(id: params[:id])
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save
      flash[:messages] = ["#{album.name} successfully added to albums."]
      redirect_to album_url(album)
    else
      flash[:messages] = errors.full_messages
      redirect_to new_band_album_url(album.band)
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    album.delete
    redirect_to bands_url
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.update(album_params)
      flash[:messages] = ["#{album.name} successfully edited."]
      redirect_to album_url(album)
    else
      flash[:messages] = album.errors.full_messages
      redirect_to albums_url
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end
end
