class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :password_digest, :uid, :provider

      t.timestamps
    end
  end
end
