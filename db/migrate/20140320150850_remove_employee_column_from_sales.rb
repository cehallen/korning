class RemoveEmployeeColumnFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :employee
  end

  def down
    add_column :sales, :employee, :string
  end
end
