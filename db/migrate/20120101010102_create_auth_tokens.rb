class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens, :primary_key => 'auth_token' do |t|
      t.string     :auth_token,               :null => false
      t.references :user,                     :null => false
      t.string     :facebook_access_token,    :null => false
      t.string     :facebook_user_id,         :null => false
      t.datetime   :facebook_expiration_date, :null => false
      t.timestamps
    end
  end
end