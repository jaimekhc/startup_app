# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  #References : http://guides.rubyonrails.org/i18n.html
  #             http://ihower.tw/rails3/i18n.html
  before_filter :set_locale
 

  #Send flash error msg when authorization fails
  rescue_from CanCan::AccessDenied do |exception|
  	#redirect_to root_path, :alert => exception.message
    if user_signed_in?
      redirect_to root_url, :alert => exception.message
    else
      # Adds the protected page to the login url but only if the user is not logged in
      redirect_to login_path(:continue => request.path), :alert => exception.message
    end
  end


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def self.default_url_options(options={})
    options.merge({ :locale => I18n.locale })
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource)
    params[:user]["continue"] || stored_location_for(resource) || user_path(resource) || root_path
  end
end
