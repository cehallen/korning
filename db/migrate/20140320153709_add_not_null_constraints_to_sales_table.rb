class AddNotNullConstraintsToSalesTable < ActiveRecord::Migration
  def up
    change_column :sales, :sale_date, :date, null: false
    change_column :sales, :sale_amount, :numeric, null: false
    change_column :sales, :units_sold, :integer, null: false
    change_column :sales, :product_id, :integer, null: false
    change_column :sales, :customer_id, :integer, null: false
    change_column :sales, :employee_id, :integer, null: false
  end

  def down
    change_column :sales, :sale_date, :date
    change_column :sales, :sale_amount, :numeric
    change_column :sales, :units_sold, :integer
    change_column :sales, :product_id, :integer
    change_column :sales, :customer_id, :integer
    change_column :sales, :employee_id, :integer
  end
end
