class FoodsController < ApplicationController
  def new
    @user = current_user
    
    if params[:inventory_id]
      @inventory = Inventory.find(params[:inventory_id])
      @food = @inventory.foods.new
    elsif params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @food = @recipe.foods.new
    else
      @food = Food.new
    end
  end

  def create
    @user = current_user
    @food = Food.new(food_params)
    
    if params[:inventory_id]
      @inventory = Inventory.find(params[:inventory_id])
      @food.inventory = @inventory
    elsif params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @food.recipe = @recipe
    end
    
    if @food.save
      redirect_to @food, notice: 'Food successfully created.'
    else
      render :new, alert: 'Food not created.'
    end
  end

  def destroy
  end
end
