class CreateAccessPoints < ActiveRecord::Migration
  def change
    create_table :access_points do |t|
      t.references :user,           :null => false
      t.string     :ssid,           :null => false
      t.string     :password,       :null => false
      t.point      :gps_coordinate, :geographic => true
      t.timestamps
    end
    add_index :access_points, :gps_coordinate, :spatial => true
  end
end