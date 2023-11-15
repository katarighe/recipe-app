class RecipeFoodsController < ApplicationController

  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
    @foods = Food.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe food successfully created.'
    else
      render :new, alert: 'Recipe food not created.'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = @recipe_food.recipe
    if @recipe_food.destroy
      redirect_to recipe_path(@recipe), notice: 'Recipe food successfully deleted.'
    else
      redirect_to recipe_path(@recipe), alert: 'Recipe food not deleted.'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
