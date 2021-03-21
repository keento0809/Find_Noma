class AddOutletColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :outlet, :boolean
  end
end
