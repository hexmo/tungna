class Product < ApplicationRecord
  has_many_attached :images

  validates :name, :description, :price, :images, :category, :brand, presence: true

  enum category: {
    guitar: 'Guitar',
    drum: 'Drum',
    piano: 'Piano & Keyboard',
    ukulele: 'Ukulele',
    wind_pipes: 'Wind pipes',
    traditional: 'Traditional Instruments',
    home_studio: 'Home Studio'
  }
end
