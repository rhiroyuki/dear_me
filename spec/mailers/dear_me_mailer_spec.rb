require 'rails_helper'

describe DearMeMailer, type: :mailer do
  describe '::dear_future_me' do
    let(:email) { build(:email, to: 'mail@mail.com') }
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
end
