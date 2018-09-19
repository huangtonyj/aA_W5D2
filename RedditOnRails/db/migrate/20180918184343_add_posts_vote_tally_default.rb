class AddPostsVoteTallyDefault < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :vote_tally
    add_column :posts, :vote_tally, :integer, null: false, default: 0
  end
end
