class CustomerSerializer < ActiveModel::Serializer
  attribute :external_code, key: :externalCode
  attributes :name, :email
  attribute :contact
end
