class Email < ApplicationRecord
  validates :to, :body, :send_date_at, presence: true

  scope :today_emails, -> { where(send_date_at: Date.current) }
end
