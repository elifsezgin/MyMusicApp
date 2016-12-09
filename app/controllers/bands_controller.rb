class BandsController < ApplicationController
  before_action :require_log_in

  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    band = Band.new(band_params)
    if band.save
      flash[:messages] = ["#{band.name} successfully added to the bands."]
      redirect_to bands_url
    else
      flash[:messages] = ["#{band.name} could not be added."]
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    band = Band.find_by(id: params[:id])
    if band.update(band_params)
      flash[:messages] = ["#{band.name} successfully edited."]
      redirect_to band_url(band)
    else
      flash[:messages] = ["Could not be edited."]
      redirect_to bands_url
    end
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.delete
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
