require 'rails_helper'

describe ConfirmEmailService do
  let(:email) { create(:email) }

  subject { described_class.perform(email.confirmation_token) }

  context 'when email token is yet not confirmed' do
    it { is_expected.to be_truthy }

    it 'sets confirmed_at to current time' do
      described_class.perform(email.confirmation_token) 

      expect(email.reload.confirmed_at).not_to be_nil
    end
  end

  context 'when email is already confirmed' do
    let!(:email) { create(:email, :confirmed) }

    it { is_expected.not_to be_truthy }
  end
end
