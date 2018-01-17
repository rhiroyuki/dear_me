class EmailsController < ApplicationController

  def create
    @email = Email.new(email_params)
    if verify_recaptcha(model: @email) && @email.save
      flash[:success] = 'Email created!'
      return render 'landing_page/index', status: :created
    end

    flash.now[:error] = @email.errors.full_messages
    render 'landing_page/index', status: :unprocessable_entity
  end

  private

  def email_params
    params.require(:email).permit(:to, :body, :send_date_at)
  end

  def check_recaptcha

  end
end
