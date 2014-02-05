class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :city_id
      t.integer :prefecture_id
      t.string :city_name
      t.string :city_yomi

      t.timestamps
    end
  end
end
