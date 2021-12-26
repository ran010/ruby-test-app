class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :status, default: 0
      t.text :notes
      t.references :employee
      t.timestamps
    end
  end
end
