class CreateMeans < ActiveRecord::Migration
  def change
    create_table :means do |t|
      t.integer :dialect_id
      t.string :mean_word
      t.integer :user_id

      t.timestamps
    end
  end
end
