class SendDailyEmailsJob < ApplicationJob
  queue_as :default

  def perform
    Email.today_emails.each do |email|
      DearMeMailer.dear_future_me(email).deliver_later
    end
  end
end
