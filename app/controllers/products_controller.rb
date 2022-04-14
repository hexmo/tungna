# frozen_string_literal: true

# Product controller
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.where(filter_params).map do |product|
      product.as_json.merge({ image: url_for(product.images[0]) })
    end
    # render json: @products
    # https://stackoverflow.com/questions/50775686/how-to-get-url-of-active-storage-image
    if params[:page].present?
      render json: @products.last(params[:page].to_i)
    else
      render json: @products
    end
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :brand, images: [])
  end

  def filter_params
    params.permit(:category)
  end
end
