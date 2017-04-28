class Convention < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :amount, presence:true
  validates :category_id, presence:true
  validates :date, presence:true
end
