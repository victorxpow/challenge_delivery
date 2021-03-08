class ItemSerializer < ActiveModel::Serializer
  attribute :external_code, key: :externalCode
  attributes :name, :price, :quantity, :total
  attribute :sub_items, key: :subItems

  def price
    object.price.to_f
  end

  def quantity
    object.quantity.to_f
  end

  def total
    object.total.to_f
  end

end
