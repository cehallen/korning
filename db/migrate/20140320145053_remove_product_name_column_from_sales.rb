class RemoveProductNameColumnFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :product_name
  end

  def down
    add_column :sales, :product_name, :integer
  end
end
