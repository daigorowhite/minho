class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :prefecture_name
      t.string :prefecture_yomi

      t.timestamps
    end
  end
end
