class OrderSerializer < ActiveModel::Serializer
  attribute :external_code, key: :externalCode
  attribute :store_id, key: :storeId, type: :string
  attribute :sub_total, key: :subTotal
  attribute :delivery_fee, key: :deliveryFee
  attributes :total_shipping, :total, :country, :state, :city, :district, :street, :complement, :latitude, :longitude
  attribute :dt_order_create, key: :dtOrderCreate
  attribute :postal_code, key: :postalCode
  attribute :number

  has_one :customer, serializer: CustomerSerializer
  has_many :items, serializer: ItemSerializer
  has_many :payments, serializer: PaymentSerializer

  def latitude
    object.latitude.to_f
  end
  
  def longitude
    object.longitude.to_f
  end
  
  def total_shipping
    object.total_shipping.to_f
  end
  
end
