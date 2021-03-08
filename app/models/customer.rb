class Customer < ApplicationRecord
  belongs_to :order

  validates :external_code, :name, :email, :number, :area_code, presence: true

  def contact
    "#{area_code}#{number}"
  end
end
