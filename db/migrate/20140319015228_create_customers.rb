# not finished. rollback.  only got one customer (motorola)
# I learned: 13, must turn match data from regex into string or else it's just a kind of object.  
# 28, for multiple params in create statements it's simpler than some crap on the net. 
# 30, weird typo in their db dump where motorola is missing a ')' so my regex bugged.   
require 'pry'


class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :account_number, null: false
      t.string :website

      t.timestamps
    end
    
    Sale.find_each do |sale|
      company = /\A[A-Za-z]+/.match(sale.customer_and_account_no).to_s
      website = ""
      if company == "LG"
        website = "http://www.lg.com/us"
      elsif company == "Motorola"
        website = "http://www.motorola.com/"
      elsif company == "Samsung"
        website = "http://www.samsung.com/us/"
      elsif company == "HTC"
        website = "http://www.htc.com/us/"
      end 
      # could make the website stuff 'dynamic' 
      account = /[A-Za-z]+\d+/.match(sale.customer_and_account_no).to_s

      Customer.find_or_create_by(account_number: account, website: website)

      # if !Customer.exists?(account_number: account)
      #   Customer.create(account_number: account, website: website)

      #   puts "Customer #{company} with acct_no #{account} and website #{website} was created!"
      # else
      #   puts "Customer #{company} already existed!"
      # end 
    end

  end
end
