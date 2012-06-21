namespace :db do
  desc "Erase and fill database with users and associate them with APs"
  task :populate => :environment do    
    point_generator = GeoPointFactory::Generator.new('lib/assets/sf_shapefile')
  
    100.times do
      if rand < 0.7
        FactoryGirl.create(:access_point, gps_coordinate: point_generator.generate)
      else
        FactoryGirl.create(:user)
      end
    end
    
    point_generator.finalize
  end
end