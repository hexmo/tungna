class Order < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, en_route: 1, delivered: 2 }
end
