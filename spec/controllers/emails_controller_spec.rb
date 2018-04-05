require 'rails_helper'

describe EmailsController, type: :controller do
  describe 'GET #confirm_email' do
    let(:email) { create(:email) }
    let(:params) do
      {
        token: email.confirmation_token
      }
    end

    describe 'successfully confirm the email' do
      before { get :confirm_email, params: params }

      it 'shows the notice message' do
        expect(flash[:notice]).to be_present
      end

      it 'has a status code of 302' do
        expect(response).to have_http_status :redirect
      end
    end

    describe 'failed to confirm the email' do
      context 'invalid token' do
        let(:params) do
          {
            token: '12313'
          }
        end

        before { get :confirm_email, params: params }

        it 'shows the alert flash' do
          expect(flash[:alert]).to be_present
        end

        it 'has a status code of 302' do
          expect(response).to have_http_status :redirect
        end
      end

      context 'when already confirmed' do
        let!(:email) { create(:email, :confirmed) }

        before { get :confirm_email, params: params }

        it 'shows the alert flash' do
          expect(flash[:alert]).to be_present
        end

        it 'has a status code of 302' do
          expect(response).to have_http_status :redirect
        end
      end
    end
  end

  describe 'POST #create' do
    let(:email) { build(:email) }

    describe 'successfull' do
      let(:params) do
        {
          email: {
            to: email.to,
            body: email.body,
            send_date_on: email.send_date_on
          }
        }
      end

      before { post :create, params: params }

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
            send_date_on: email.send_date_on
          }
        }
      end

      before { post :create, params: params }

      it 'returns the status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
