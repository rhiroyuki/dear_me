require 'rails_helper'

describe DearMeMailer, type: :mailer do
  let(:email) { build(:email, to: 'mail@mail.com', confirmation_token: '123') }

  describe '.dear_future_me' do
    subject { described_class.dear_future_me(email) }

    it 'shows the correct subject' do
      expect(subject.subject).to eq('Dear me in the future :)')
    end

    it 'sends the mail to the correct email' do
      expect(subject.to).to eq(['mail@mail.com'])
    end

    it 'renders the body' do
      expect(subject.body.encoded).to include(email.body)
    end
  end

  describe '.send_email_token_confirmation' do
    subject { described_class.send_email_token_confirmation(email).deliver_now }

    it 'renders the subject' do
      expect(subject.subject).to eq('Confirm the email you will receive from DearMe')
    end

    it 'renders the receiver email' do
      expect(subject.to).to eq(['mail@mail.com'])
    end

    it 'assigns @token' do
      expect(subject.body.encoded).to match('123')
    end

    it 'sends an email' do
      expect{ subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
