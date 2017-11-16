class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :validation, :string
    add_column :products, :category, :string
    add_column :products, :year, :integer
  end
end
