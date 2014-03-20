require 'pry'

class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email

      t.timestamps
    end

    Sale.find_each do |sale|
      first_name = sale.employee.split[0]
      last_name  = sale.employee.split[1]
      email      = (sale.employee.split[2]).gsub(/[()]/, "")
      
      Employee.find_or_create_by(first_name: first_name, last_name: last_name, email: email)
# binding.pry
    end
  end
end

#