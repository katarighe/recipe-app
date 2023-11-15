class InventoriesController < ApplicationController
  def index
    user = current_user
    @inventories = user.inventories
  end

  def show
    @inventory = Inventory.find(params[:id])
    @inventory_foods = @inventory.foods
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
    if @inventory.save
      redirect_to @inventory, notice: 'Inventory successfully created.'
    else
      render :new, alert: 'Inventory not created.'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    if @inventory.destroy
      redirect_to inventories_path, notice: 'Inventory successfully deleted.'
    else
      render :index, alert: 'Inventory not deleted.'
    end
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :user_id)
  end
end
