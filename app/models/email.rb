class Email < ApplicationRecord
  validates :to, :body, :send_date_at, presence: true
end
