class OrderDetail < ApplicationRecord

    belongs_to :customer

    validates :customer_id, presence: true
    validates :price_total, numericality: {only_integer: true}
    validates :postage, numericality: {only_integer: true}
    validates :postal_code, length: {is: 7}, numericality: {only_integer: true}
    validates :address, presence: true
    validates :name, presence: true
    validates :payment_method, presence: true
    validates :address, presence: true

    enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
	enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

end
