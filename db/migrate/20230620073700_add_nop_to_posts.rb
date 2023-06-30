class AddNopToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :nop, :string
  end
end
