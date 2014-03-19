class AddProductIdToSales < ActiveRecord::Migration
  def change
    add_column :sales, :product_id, :integer

    Sale.reset_column_information

    Sale.find_each do |sale|
      product = Product.find_by(name: sale.product_name)
      sale.product_id = product.id 
      sale.save
    end
  end
end
