class CreateDialects < ActiveRecord::Migration
  def change
    create_table :dialects do |t|
      t.integer :dialect_id
      t.string :dialect_word

      t.timestamps
    end
  end
end
