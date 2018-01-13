class DearMeMailer < ApplicationMailer
  default from: "You from the past <#{ENV['MAILGUN_SMTP_LOGIN']}>"

  def dear_future_me(email)
    @body = email.body
    mail(to: email.to, subject: 'Dear me in the future :)')
  end
end
