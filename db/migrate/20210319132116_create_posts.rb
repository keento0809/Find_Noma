class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :img
      t.string :comment
      t.boolean :wifi

      t.timestamps
    end
  end
end
