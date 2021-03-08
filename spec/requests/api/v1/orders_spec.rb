require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST #create' do
    context 'sucessfully' do
      let(:params) { { foo: 'bar' } }

      before { post api_v1_orders_path, params: params }

      it 'response with created' do
        expect(response).to have_http_status :created
      end
    end

    context 'fail' do
      let(:params) { {} }

      before { post api_v1_orders_path, params: params }

      it 'missing params' do
        expect(response).to have_http_status :created
      end
    end
  end
end
