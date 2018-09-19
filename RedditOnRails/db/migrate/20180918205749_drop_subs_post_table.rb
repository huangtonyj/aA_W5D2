class DropSubsPostTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :subs_posts
  end
end
