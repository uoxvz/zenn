class AddModeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :mode, :string
  end
end
