

class AddEmployeeIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :employee_id, :integer

    Sale.reset_column_information

    Sale.find_each do |sale|
      first_name = sale.employee.split[0]

      employee = Employee.find_by(first_name: first_name)
      sale.employee_id = employee.id
      sale.save

    end
  end
end

#