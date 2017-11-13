class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :tracking_number

      t.timestamps
    end
  end
end
