class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hives, :integer
    add_column :users, :since, :integer
    add_column :users, :validation, :string
  end
end
