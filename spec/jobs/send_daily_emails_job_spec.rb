require 'rails_helper'

describe SendDailyEmailsJob, type: :job do
  describe '#perform' do
    let(:email) { build(:email) }

    it 'calls on the DearMeMailer' do
      allow(Email).to receive(:today_emails).and_return([email])
      allow(DearMeMailer).to receive_message_chain(:dear_future_me, :deliver_now)

      described_class.new.perform

      expect(DearMeMailer).to have_received(:dear_future_me)
    end
  end

  describe '.perform_later' do
    it 'adds the job to the queue' do
      allow(DearMeMailer).to receive_message_chain(:dear_future_me, :deliver_now)
      described_class.perform_later
      expect(enqueued_jobs.last[:job]).to eq described_class
    end
  end
end
