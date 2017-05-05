class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :conventions

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def percent_json(categories)
    convention_amounts =[]
    categories.where(:category_type => "Expense").each {|cat| exp_amounts << cat.total(self)}
    categories.where(:category_type => "Profit").each {|cat| exp_amounts << cat.total(self)}
    proArr = []
    expArr = []
    categories.each do |cat|
      if cat.category_type == "Expense"
        expArr << {name: cat.name, y:(cat.total(self)/convention_amounts.sum) * 100}
      else
        proArr << {name: cat.name, y:(cat.total(self)/convention_amounts.sum) * 100}
      end
    end
    arr = [expArr, proArr]
  end

end
