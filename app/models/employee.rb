class Employee < ActiveRecord::Base
  has_many :sales
  validates :first_name, presence: true
  validates :last_name, presence: true
end
