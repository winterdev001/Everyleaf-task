class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :set_locale

  # private
  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  # def default_url_options(options = {})
  #   { locale: I18n.locale}.merge options
  # end
  protect_from_forgery with: :exception
  include SessionsHelper 

  def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        current_user.present?
    end
end
