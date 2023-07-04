class AddDiscordToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :discord, :string
  end
end
