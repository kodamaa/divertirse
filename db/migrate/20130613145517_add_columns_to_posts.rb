class AddColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author, :string
    add_column :posts, :category_id, :integer
  end
end
