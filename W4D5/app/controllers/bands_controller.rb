class BandsController < ApplicationController

  before_action :require_current_user!

  def index
    @bands = Band.all
    render :index
  end

  def show
      @band = Band.find(params[:id])
      @albums = Album.where(band_id: params[:id])
      render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
        redirect_to band_url(@band)
    else
      flash[:error] = ['Need a new name']
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def edit
      @band = Band.find(params[:id])
      render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end

end
