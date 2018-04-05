class Email < ApplicationRecord
  has_secure_token :confirmation_token

  validates :to, :body, :send_date_on, presence: true

  scope :today_emails, -> { where(send_date_on: Date.current) }

  def from
    ENV.fetch('MAILGUN_SMTP_LOGIN', '')
  end
end
