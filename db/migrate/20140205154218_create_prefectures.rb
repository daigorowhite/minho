class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.integer :prefecture_id
      t.string :prefecture_name
      t.string :prefecture_yomi

      t.timestamps
    end
  end
end
