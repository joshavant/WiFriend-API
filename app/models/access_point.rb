class AccessPoint < ActiveRecord::Base
  set_rgeo_factory_for_column(:gps_coordinate, RGeo::Geographic.spherical_factory(:srid => 4326))
  belongs_to :user
end