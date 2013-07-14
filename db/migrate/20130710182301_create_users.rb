class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :password_digest, :uid, :provider, :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end      
      
  