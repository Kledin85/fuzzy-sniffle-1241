require 'rails_helper'

RSpec.describe "show page" do

  before :each do
    @chef1 = Chef.create!(name: "name1")
    @ingrediant1 = Ingredient.create!(name: "ingrediant1", calories: 1)
    @ingrediant2 = Ingredient.create!(name: "ingrediant2", calories: 2)
    @ingrediant3 = Ingredient.create!(name: "ingrediant3", calories: 3)
    @dish1 = Dish.create!(name: "name1", description: "this is dish 1", chef_id: @chef1.id)
    @dish1ingrediants = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingrediant1.id)
  end
  describe 'story 1' do 
#     As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# and a total calorie count for that dish
# And I see the chef's name.
    it 'shows the dishes name and descriptions' do
      visit "dishes/#{@dish1.id}"
      
      expect(page).to have_content(@dish1.name)
      expect(page).to have_content(@dish1.description)
    end
    it 'shows a list of ingredients and total calorie count' do
      visit "dishes/#{@dish1.id}"
      expect(page).to have_content(@ingrediant1.name)
      expect(page).to have_content(@ingrediant1.calories)
    end
    it 'shows the chefs name' do
      visit "dishes/#{@dish1.id}"
      
      expect(page).to have_content(@dish1.chef.name)
    end
  end
end