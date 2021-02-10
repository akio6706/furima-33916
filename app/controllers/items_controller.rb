class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
end