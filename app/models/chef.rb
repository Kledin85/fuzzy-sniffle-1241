class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    self.dishes.select('ingredients.name')
  end
end