class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false

      t.timestamps
    end
    Sale.find_each do |sale|
      if !Product.exists?(name: sale.product_name)
        Product.create(name: sale.product_name)
      end
    end
  end
end
