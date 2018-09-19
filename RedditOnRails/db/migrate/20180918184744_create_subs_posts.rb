class CreateSubsPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :subs_posts do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false
    end

    add_index :subs_posts, [:sub_id, :post_id], unique: true
    add_index :subs_posts, :post_id

  end
end
