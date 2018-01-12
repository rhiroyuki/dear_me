class EmailsController < ApplicationController
  def create
    # schedule email to send it
    @email = Email.new(email_params)
    if @email.save
      flash[:success] = 'Email created!'
      return redirect_to root_url, status: :created
    end
    flash[:error] = @email.errors.full_messages
    redirect_to root_url
  end

  private

  def email_params
    params.require(:email).permit(:to, :body, :send_date_at)
  end
end
