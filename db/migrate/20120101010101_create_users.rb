class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name,               :null => false
      t.string   :last_name,                :null => false
      t.string   :facebook_user_id,         :null => false
      t.string   :profile_picture_url,      :null => false
      t.timestamps
    end
  end
end