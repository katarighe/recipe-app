class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @recipes = @recipes.order(:created_at).reverse_order
  end
end
