class InventoriesController < ApplicationController

  def index
    user = current_user
    @inventories = user.inventories
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.user = current_user
    if @inventory.save
      redirect_to @inventory
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :user_id)
  end
end
