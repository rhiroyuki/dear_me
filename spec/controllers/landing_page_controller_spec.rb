require 'rails_helper'

describe LandingPageController, type: :controller do
  describe 'GET :index' do
    it 'has status code 200 (ok)' do
      get :index

      expect(response).to be_ok
    end
  end
end
