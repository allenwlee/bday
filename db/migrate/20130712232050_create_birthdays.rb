class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.string :email, :first_name, :last_name
      t.integer :month, :day
      
      t.timestamps
    end
  end
end
