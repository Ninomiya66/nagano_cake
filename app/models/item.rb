class Item < ApplicationRecord

  has_one_attached :image

  def get_image(width, height)

    unless image.attached?

      file_path = Rails.root.join('app/assets/images/no_image.jpg')

      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')

    end

    image.variant(resize_to_limit: [width, height]).processed

  end

  def tax_price

    (price * 1.1).floor

  end

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  belongs_to :genre

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true

end
