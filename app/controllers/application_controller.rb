class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :default_url_options
  helper_method :set_admin , :is_admin?

  def set_admin
    @admin = true
  end

  def is_admin?
    @admin == true
  end

 # ensure locale persists
  def default_url_options(options={})
    {:locale => I18n.locale}
  end

end
