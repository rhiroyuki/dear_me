require 'rails_helper'

describe EmailsController, type: :controller do
  describe 'POST #create' do
    let(:email) { build(:email) }

    describe 'successfull' do
      let(:params) do
        {
          email: {
            to: email.to,
            body: email.body,
            send_date_at: email.send_date_at
          }
        }
      end

      before do
        post :create, params: params
      end

      it 'redirects to root path' do
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'unsucessfull' do
      let(:params) do
        {
          email: {
            to: '',
            body: email.body,
            send_date_at: email.send_date_at
          }
        }
      end

      before do
        post :create, params: params
      end

      it 'returns the status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
