# frozen_string_literal: true

class ConfirmEmailService
  def initialize(token)
    @token = token
  end

  def self.perform(token)
    new(token).perform
  end

  def perform
    email.update(confirmed_at: Time.current) if valid?
  end

  private

  def email
    @email ||= Email.find_by(confirmation_token: @token)
  end

  def valid?
    email && email.confirmed_at.nil?
  end
end
