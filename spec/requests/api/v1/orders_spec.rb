require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST #create' do
    context 'sucessfully' do
      let(:params) { JSON.parse(File.read('spec/fixtures/payload.json')) }

      it 'creates a new order' do
        post api_v1_orders_path(order: params)

        expect(response).to have_http_status :created
      end
    end

    context 'fail' do
      let(:params) { {} }

      it 'missing params' do
        post api_v1_orders_path(order: params)

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
