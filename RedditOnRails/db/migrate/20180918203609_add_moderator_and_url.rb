class AddModeratorAndUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :moderator_id, :integer, null: false
    add_column :posts, :url, :string
  end
end
