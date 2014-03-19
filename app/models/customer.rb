class Customer < ActiveRecord::Base
  has_many :sales
  validates :account_number, presence: true
end
