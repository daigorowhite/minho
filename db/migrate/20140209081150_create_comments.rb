class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :dialect_id
      t.string :comment_word
      t.integer :user_id

      t.timestamps
    end
  end
end
