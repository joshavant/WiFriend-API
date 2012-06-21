require 'faker'

FactoryGirl.define do
  factory :user do
    first_name                { Faker::Name.first_name }
    last_name                 { Faker::Name.last_name }
    facebook_user_id          "123456"
    profile_picture_url       "http://fbcdn-profile-a.akamaihd.net/hprofile-ak-snc4/161533_6222246_1854590152_n.jpg"
  end
  
  # gps_coordinate MUST be specified when `[#build|#create]`-ing
  # i.e. FactoryGirl.create(:access_point, gps_coordinate: some_point)
  factory :access_point do
    association  :user
    ssid           { Faker::Name.first_name + Faker::Internet.domain_word.capitalize }
    password       { rand(2**256).to_s(36).ljust(8,'a')[0..rand(2..10)] }
    gps_coordinate { gps_coordinate }
  end
end