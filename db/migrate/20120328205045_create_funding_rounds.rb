class CreateFundingRounds < ActiveRecord::Migration
  def change
    create_table :funding_rounds do |t|
      t.references :company
      t.integer :number_of_shares
      t.integer :cost_per_share

      t.timestamps
    end
    add_index :funding_rounds, :company_id
  end
end
