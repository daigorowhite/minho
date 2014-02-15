class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_name
      t.string :password
      t.integer :prefecture_id
      t.integer :city_id

      t.timestamps
    end
  end
end
