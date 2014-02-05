class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.integer :example_id
      t.integer :dialect_id
      t.string :example_word
      t.integer :user_id

      t.timestamps
    end
  end
end
