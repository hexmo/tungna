# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum role: { customer: 0, admin: 100 } # https://blog.saeloun.com/2022/01/05/how-to-use-enums-in-rails.html

  has_many :cart_items
  has_many :orders

  def cart_items_price
    total_price = 0
    cart_items.each do |item|
      total_price += item.product.price
    end

    total_price
  end
end
