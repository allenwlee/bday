class CreateUsers < ActiveRecord::Migration

  attr_accessible :provider, :uid, :name
  
  def change
    create_table :users do |t|
      t.string :username, :email, :password_digest, :uid, :provider

      t.timestamps
    end
  end
end
