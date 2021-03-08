class PaymentSerializer < ActiveModel::Serializer
  attribute :payment_type, key: :type
  attribute :value

  def value
    object.value.to_f
  end

end
