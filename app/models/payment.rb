class Payment < ApplicationRecord
  belongs_to :order

  validates :payment_type, :value, presence: true
end
