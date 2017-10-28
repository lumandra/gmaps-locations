class Location < ApplicationRecord

  validates_presence_of :name

  def self.convert_area(params)
    params[:area] =
      RGeo::GeoJSON.decode(
      "{\"type\":\"Polygon\",\"coordinates\":[#{JSON.parse(params[:area])}]}",
      json_parser: :json
      )
    params
  end
end
