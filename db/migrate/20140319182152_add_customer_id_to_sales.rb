class AddCustomerIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :customer_id, :integer

    Sale.reset_column_information

    Sale.find_each do |sale|
      company = /\A[A-Za-z]+/.match(sale.customer_and_account_no).to_s
      
      customer = Customer.find_by(name: company)
      sale.customer_id = customer.id
      sale.save
    end
  end
end

