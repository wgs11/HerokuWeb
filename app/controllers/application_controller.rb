class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def authenticate
    authenticate_or_request_with_http_basic(Rails.application.secrets.PASSWORD) do |username, password|
      username == Rails.application.secrets.USERNAME && password == Rails.application.secrets.PASSWORD
    end
  end


end
