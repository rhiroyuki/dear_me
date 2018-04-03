require 'rails_helper'

describe SendDailyEmailsJob, type: :job do
  let!(:email) { create(:email, send_date_at: Time.current) }

  before do
    allow(DearMeMailer).to receive(:dear_future_me).and_call_original
  end

  describe '#perform' do
    it 'calls DearMeMailer' do
      described_class.perform_now

      expect(DearMeMailer).to have_received(:dear_future_me).with(email)
    end
  end
end
