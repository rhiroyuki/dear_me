class DearMeMailer < ApplicationMailer
  def dear_future_me(email)
    @body = email.body

    mail(to: email.to,
         from: "You from the past <#{email.from}>",
         subject: 'Dear me in the future :)')
  end

  def token_confirmation(email)
    @token = email.confirmation_token

    mail(to: email.to,
         from: email.from,
         subject: 'Confirm the email you will receive from DearMe')
  end
end
