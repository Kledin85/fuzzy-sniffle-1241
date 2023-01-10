require 'rails_helper'

RSpec.describe "chefs show page" do
  before :each do
    @chef1 = Chef.create!(name: "name1")
    @chef2 = Chef.create!(name: "name2")
    @ingrediant1 = Ingredient.create!(name: "ingrediant1", calories: 1)
    @ingrediant2 = Ingredient.create!(name: "ingrediant2", calories: 2)
    @ingrediant3 = Ingredient.create!(name: "ingrediant3", calories: 3)
    @dish1 = Dish.create!(name: "dish1", description: "this is dish 1", chef_id: @chef1.id)
    @dish2 = Dish.create!(name: "dish2", description: "this is dish 2", chef_id: @chef2.id)
    @dish1ingrediants = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingrediant1.id)
  end
  describe "story 2" do
#     As a visitor
# When I visit a chef's show page
# I see the name of that chef
# and I see a list of all dishes that belong to that chef
# and I see a form to add an existing dish to that chef
# When I fill in the form with the ID of a dish that exists in the database
# And I click Submit
# Then I am redirected to that chef's show page
# And I see the dish is now listed. 
    it 'shows the chefs name and all dishes that belong to the chef' do
      visit "/chefs/#{@chef1.id}"
      expect(page).to have_content(@chef1.name)
      expect(page).to have_content(@dish1.name)
    end
    it 'has a form to add an existing dish to that chef' do
      visit "/chefs/#{@chef1.id}"
      
      fill_in 'Dish', with: @dish2.id
      click_button 'Save'

      save_and_open_page

      expect(page).to have_content(@dish2.name)

    end
    it 'when i fill the form in with an id of a dish and click submit im taken back to the chefs show page with the new item on the page'
  end
end