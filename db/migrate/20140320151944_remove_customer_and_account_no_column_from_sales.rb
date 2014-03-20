class RemoveCustomerAndAccountNoColumnFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :customer_and_account_no
  end

  def down
    add_column :sales, :customer_and_account_no, :string
  end
end
