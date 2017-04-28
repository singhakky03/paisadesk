class Category < ActiveRecord::Base


  belongs_to :user
  has_one :convention

  validates :name, presence: true
  TYPE = ["Expense", "Profit"]
end
