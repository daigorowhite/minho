class CreateDialects < ActiveRecord::Migration
  def change
    create_table :dialects do |t|
      t.integer :prefecture_id
      t.integer :city_id
      t.string :dialect_word

      t.timestamps
    end
  end
end
