require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  xdescribe 'POST #create' do
    context 'sucessfully' do
      let(:valid_params) { JSON.parse(File.read('spec/fixtures/payload.json')) }
      
      it "creates a new order" do
        post :create, params: valid_params

        expect(response).to have_http_status :created
        expect(response.headers['Location']).to eq api_v1_order_url(Order.last)
      end
    end

    context 'fail' do
      let(:invalid_params) { {} }

      before { post api_v1_orders_path, params: invalid_params }

      it 'missing params' do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
