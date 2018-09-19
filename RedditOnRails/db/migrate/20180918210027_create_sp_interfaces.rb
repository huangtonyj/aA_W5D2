class CreateSpInterfaces < ActiveRecord::Migration[5.2]
  def change
    create_table :sp_interfaces do |t|
      t.integer :sub_id, null:false
      t.integer :post_id, null:false
      t.timestamps
    end
    add_index :sp_interfaces, [:sub_id, :post_id], unique: true
    add_index :sp_interfaces, :post_id
  end
end
