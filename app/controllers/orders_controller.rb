# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    order_details = {user_id: current_user.id, price: current_user.cart_items_price, description: description }
    @order = Order.new(order_params.merge(order_details))

    if @order.save
      current_user.cart_items.destroy_all
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:delivery_location)
  end

  def description
    order_description = ''
    current_user.cart_items.each do |item|
      order_description += "[#{item.product.name} | Rs. #{item.product.price}/-]"
    end
    order_description
  end
end
