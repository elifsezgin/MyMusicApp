class TracksController < ApplicationController
  before_action :require_log_in

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    track = Track.new(track_params)
    if track.save
      flash[:messages] = ["#{track.name} successfully added to tracks."]
      redirect_to track_url(track)
    else
      flash[:messages] = track.errors.full_messages
      redirect_to new_album_track_url(track.album)
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    track = Track.find_by(id: params[:id])
    if track.update(track_params)
      flash[:messages] = ["#{track.name} successfully edited."]
      redirect_to track_url(track)
    else
      flash[:messages] = track.errors.full_messages
      redirect_to tracks_url
    end
  end

  def destroy
    album = track.album
    track = Track.find_by(id: params[:id])
    track.delete

    redirect_to album_url(album)
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :kind, :lyrics)
  end

end
