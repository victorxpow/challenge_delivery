class Item < ApplicationRecord
  belongs_to :order

  validates :external_code, :name, :price, :quantity, :total, presence: true

  def sub_items
    []
  end
end
