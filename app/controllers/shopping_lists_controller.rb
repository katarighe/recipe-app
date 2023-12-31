class ShoppingListsController < ApplicationController
  include ShoppingListsHelper

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory][:inventory_id])
    @shopping_list = shopping_list
    @total_foods_value = total_value_of_food_needed(@shopping_list)
  end
end
