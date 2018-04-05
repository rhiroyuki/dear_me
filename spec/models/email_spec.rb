require 'rails_helper'

RSpec.describe Email, type: :model do
  it { is_expected.to validate_presence_of :to }
  it { is_expected.to validate_presence_of :send_date_on }
  it { is_expected.to validate_presence_of :body }

  describe '#today_emails' do
    subject { Email.today_emails }

    let(:email_to_send_today) { create(:email, send_date_on: Date.current) }
    let(:email_to_send_yesterday) { create(:email, send_date_on: Date.current.yesterday) }
    let(:email_to_send_tomorrow) { create(:email, send_date_on: Date.current.tomorrow) }

    it 'returns only the emails to send today' do
      is_expected.to match_array([email_to_send_today])
    end
  end
end
