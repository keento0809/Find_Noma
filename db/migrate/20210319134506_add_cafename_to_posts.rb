class AddCafenameToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cafename, :string
  end
end
