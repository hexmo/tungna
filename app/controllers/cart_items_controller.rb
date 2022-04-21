# frozen_string_literal: true

# cart items
class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: %i[show update destroy]

  # GET /cart_items
  def index
    @cart_items = current_user.cart_items

    render json: @cart_items
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params.merge(user_id: current_user.id))

    if @cart_item.save
      render json: @cart_item, status: :created, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
  end

  def cart_items_price
    render json: { price: current_user.cart_items_price }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_item_params
    params.require(:cart_item).permit(:product_id)
  end
end
