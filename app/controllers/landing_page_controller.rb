class LandingPageController < ApplicationController
  def index
    @email = Email.new
  end
end
