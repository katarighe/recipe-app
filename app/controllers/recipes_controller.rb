class RecipesController < ApplicationController

  def index
    @user = current_user
    @recipes = @user.recipes
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: "Recipe was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:notice] = "Recipe deleted."
      redirect_to recipes_path
    else
      flash[:alert] = "Error deleting recipe."
      redirect_to recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time_hours, :cooking_time_hours, :description, :public)
  end
end
