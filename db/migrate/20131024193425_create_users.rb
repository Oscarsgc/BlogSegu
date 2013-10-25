class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :career
      t.date :birthday
      t.integer :rating

      t.timestamps
    end
  end
end
