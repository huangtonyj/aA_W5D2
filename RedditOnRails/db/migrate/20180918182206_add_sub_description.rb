class AddSubDescription < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :description, :text, null:false
  end
end
