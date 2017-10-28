class LocationController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :convert_geojson, only: [:create, :update]
  before_action :set_gon, only: [:edit, :show]

  def index
    @locations = Location.all
  end

  def create
    Location.create(@new_params) ? (redirect_to location_index_path) : (render :new)
  end

  def new
    @location = Location.new
  end

  def update
    @location.update(@new_params) ? (redirect_to location_path @location) : (render :edit)
  end

  def edit
  end

  def show
  end

  def destroy
    @location.destroy
    redirect_to location_index_path
  end

  private

  def set_location
    @location = Location.find_by(id: params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :area)
  end

  def convert_geojson
    @new_params = Location.convert_area(location_params)
  end

  def set_gon
    gon.coordinates = @location.area.coordinates
  end

end
