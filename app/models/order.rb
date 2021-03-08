class Order < ApplicationRecord
  has_many :items
  has_many :payments
  has_one :customer

  accepts_nested_attributes_for :customer
  validates_associated :customer

  accepts_nested_attributes_for :items
  validates_associated :items

  accepts_nested_attributes_for :payments
  validates_associated :payments

  validates :external_code,
            :store_id,
            :sub_total,
            :delivery_fee,
            :total,
            :country,
            :total_shipping,
            :complement,
            :state,
            :city,
            :district,
            :street,
            :latitude,
            :longitude,
            :dt_order_create,
            :postal_code,
            :number, presence: true

  def number
    '0'
  end
end
