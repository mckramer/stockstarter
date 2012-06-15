class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.references :funding_round
      t.integer :shares

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :funding_round_id
  end
end
