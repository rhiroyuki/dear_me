class EmailsController < ApplicationController
  def create
    # schedule email to send it
    redirect_to root_url
  end
end
