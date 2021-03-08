class Payment < ApplicationRecord
  belongs_to :order

  validates :type, :value, presence: true
end
