class EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)

    if verify_recaptcha(model: @email) && @email.save
      return redirect_to root_path
    end

    render 'landing_page/index', status: :unprocessable_entity
  end

  private

  def email_params
    params.require(:email).permit(:to, :body, :send_date_at)
  end
end
