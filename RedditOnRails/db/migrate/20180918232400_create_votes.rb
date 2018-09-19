class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :value, null:false, default: 0
      t.timestamps
    end
  end
end
