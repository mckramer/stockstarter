class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.references :company
      t.references :user
      t.string :role

      t.timestamps
    end
    add_index :company_users, :company_id
    add_index :company_users, :user_id
  end
end
