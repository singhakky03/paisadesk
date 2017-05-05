class Category < ActiveRecord::Base


  belongs_to :user
  has_one :convention

  validates :name, presence: true
  TYPE = ["Expense", "Profit"]

  def total(user)
    Convention.where(user_id: user.id, category_id: self.id).pluck(:amount).sum
  end



end


