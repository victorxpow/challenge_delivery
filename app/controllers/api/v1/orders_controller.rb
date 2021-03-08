class Api::V1::OrdersController < ApplicationController
  wrap_parameters :order, include: %i[id
                                      store_id
                                      date_created
                                      total_amount
                                      total_shipping
                                      total_amount_with_shipping
                                      order_items
                                      payments
                                      shipping
                                      buyer]

  def create
    @order = Order.new(order_params)
    order_serialized = ActiveModelSerializers::SerializableResource.new(@order, { serializer: OrderSerializer })

    if @order.save
      render json: @order, status: :created if OrderServices.call(order_serialized)
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    order_params = params.require(:order).permit(parameters)

    order_params[:external_code] = order_params.delete :id
    order_params[:sub_total] = order_params.delete :total_amount
    order_params[:delivery_fee] = order_params.delete :total_shipping
    order_params[:total] = order_params.delete :total_amount_with_shipping
    order_params[:dt_order_create] = order_params.delete :date_created
    order_params[:items_attributes] = order_params.delete :order_items
    order_params[:payments_attributes] = order_params.delete :payments
    order_params[:customer_attributes] = order_params.delete :buyer
    order_params[:items_attributes].each do |item|
      item[:price] = item.delete :unit_price
      item[:total] = item.delete :full_unit_price
      item[:external_code] = item[:item].delete :id
      item[:name] = item[:item].delete :title
      item.delete :item
    end

    order_params[:payments_attributes].each do |payment|
      payment[:value] = payment.delete :total_paid_amount
      order_params[:number] = payment.delete :taxes_amount
      order_params[:total_shipping] = payment.delete :shipping_cost
    end

    order_params[:country] = order_params[:shipping][:receiver_address][:country].delete :id
    order_params[:state] = order_params[:shipping][:receiver_address][:state].delete :id
    order_params[:city] = order_params[:shipping][:receiver_address][:city].delete :name
    order_params[:district] = order_params[:shipping][:receiver_address][:neighborhood].delete :name
    order_params[:street] = order_params[:shipping][:receiver_address].delete :street_name
    order_params[:latitude] = order_params[:shipping][:receiver_address].delete :latitude
    order_params[:longitude] = order_params[:shipping][:receiver_address].delete :longitude
    order_params[:complement] = order_params[:shipping][:receiver_address].delete :comment
    order_params[:postal_code] = order_params[:shipping][:receiver_address].delete :zip_code

    order_params[:shipping][:receiver_address].delete :state
    order_params[:shipping][:receiver_address].delete :city
    order_params[:shipping][:receiver_address].delete :street_number
    order_params[:shipping][:receiver_address].delete :neighborhood
    order_params[:shipping][:receiver_address].delete :country
    order_params[:shipping][:receiver_address].delete :receiver_address
    order_params[:shipping].delete :receiver_address
    order_params.delete :shipping

    order_params[:customer_attributes][:external_code] = order_params[:customer_attributes].delete :id
    order_params[:customer_attributes][:name] = order_params[:customer_attributes].delete :nickname
    order_params[:customer_attributes][:email] = order_params[:customer_attributes].delete :email
    order_params[:customer_attributes][:number] = order_params[:customer_attributes][:phone].delete :number
    order_params[:customer_attributes][:area_code] = order_params[:customer_attributes][:phone].delete :area_code
    order_params[:customer_attributes].delete :phone

    order_params.permit!
  end

  def parameters
    parameters = [:id,
                  :store_id,
                  :date_created,
                  :total_amount,
                  :total_shipping,
                  :total_amount_with_shipping,
                  { order_items: [
                    :quantity,
                    :unit_price,
                    :full_unit_price,
                    { item: %i[id title] }
                  ],
                    payments:
                    %i[payment_type total_paid_amount taxes_amount shipping_cost],
                    shipping: [
                      {
                        receiver_address:
                        [
                          :street_name,
                          :street_number,
                          :comment,
                          :zip_code,
                          :latitude,
                          :longitude,
                          :complement,
                          {
                            city: [:name],
                            state: [:id],
                            country: [:id],
                            neighborhood: [:name]
                          }
                        ]
                      }
                    ],
                    buyer: [
                      :id, :nickname, :email,
                      {
                        phone: %i[area_code number]
                      }
                    ] }]
  end
end
