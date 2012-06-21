class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, :primary_key => 'user_id' do |t|
      t.references :user,        :null => false
      t.references :friend_user, :null => false
    end
  end
end
