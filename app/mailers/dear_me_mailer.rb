class DearMeMailer < ApplicationMailer
  default from: ENV['MAILGUN_SMTP_LOGIN']

  def dear_future_me(email)
    @body = email.body
    mail(to: email.to, subject: 'Dear present me')
  end
end
