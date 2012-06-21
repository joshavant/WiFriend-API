# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120101010104) do

  create_table "access_points", :force => true do |t|
    t.integer  "user_id",                                                                    :null => false
    t.string   "ssid",                                                                       :null => false
    t.string   "password",                                                                   :null => false
    t.spatial  "gps_coordinate", :limit => {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime "created_at",                                                                 :null => false
    t.datetime "updated_at",                                                                 :null => false
  end

  add_index "access_points", ["gps_coordinate"], :name => "index_access_points_on_gps_coordinate", :spatial => true

  create_table "auth_tokens", :primary_key => "auth_token", :force => true do |t|
    t.integer  "user_id",                  :null => false
    t.string   "facebook_access_token",    :null => false
    t.string   "facebook_user_id",         :null => false
    t.datetime "facebook_expiration_date", :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "friendships", :primary_key => "user_id", :force => true do |t|
    t.integer "friend_user_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",          :null => false
    t.string   "last_name",           :null => false
    t.string   "facebook_user_id",    :null => false
    t.string   "profile_picture_url", :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
