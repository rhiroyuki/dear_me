class EmailsController < ApplicationController
  def create
    @email = Email.new(email_params)

    if verify_recaptcha(model: @email) && @email.save
      DearMeMailer.token_confirmation(@email).deliver_later
      return redirect_to root_path
    end

    render 'landing_page/index', status: :unprocessable_entity
  end

  def confirm_email
    if ConfirmEmailService.perform(params[:token])
      return redirect_to root_path, notice: 'Email confirmed!'
    end

    redirect_to root_path, alert: 'Token invalid or expired.'
  end

  private

  def email_params
    params.require(:email).permit(:to, :body, :send_date_on)
  end
end
