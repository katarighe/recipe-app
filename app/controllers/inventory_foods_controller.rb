class InventoryFoodsController < ApplicationController
  def new
    @user = current_user
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new
    @foods = Food.all
  end

  def create
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = @inventory.inventory_foods.new(inventory_food_params)
    if @inventory_food.save
      redirect_to inventory_path(@inventory), notice: 'Inventory food successfully created.'
    else
      render :new, alert: 'Inventory food not created.'
    end
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory = @inventory_food.inventory
    if @inventory_food.destroy
      redirect_to inventory_path(@inventory), notice: 'Inventory food successfully deleted.'
    else
      redirect_to inventory_path(@inventory), alert: 'Inventory food not deleted.'
    end
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:quantity, :food_id)
  end
end
