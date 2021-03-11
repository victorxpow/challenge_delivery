require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST #create' do
    let(:order_service) { instance_spy(OrderServices) }
    context 'sucessfully' do
      let(:params) { JSON.parse(File.read('spec/fixtures/payload.json')) }
      
      before do
        allow(order_service).to receive(:call).and_return(true)

        post api_v1_orders_path(order: params)
      end

      it 'creates a new order' do

        expect(response).to have_http_status :created
      end
      it 'create new order' do
        expect(Order.count).to eq(1)
      end

      it 'create new order items' do
        expect(Item.count).to eq(1)
      end

      it 'create new customer' do
        expect(Customer.count).to eq(1)
      end

      it 'create new payment' do
        expect(Payment.count).to eq(1)
      end
    end

    context 'when it fails remote request' do
      let(:params) { JSON.parse(File.read('spec/fixtures/payload.json')) }

      before do
        allow_any_instance_of(OrderServices).to receive(:call).and_return(false)

        post api_v1_orders_path(order: params)
      end

      it 'respond with 503 status service unavailable' do
        expect(response).to have_http_status(:service_unavailable)
      end
    end
  end
end