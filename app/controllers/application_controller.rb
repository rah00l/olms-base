class ApplicationController < ActionController::Base
  
  before_filter :prepare_for_mobile
  before_filter :set_user_language
  
  helper :all # include all helpers, all the time

  # Return the value for a given setting
  def s(identifier)
    Setting.get(identifier)
  end
  helper_method :s
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9fe6825f97cc334d88925fde5c4808a8'
  
  alias :logged_in? :user_signed_in?
  helper_method :logged_in?

  layout Proc.new { |controller| 
    if devise_controller?
      "login"
    else
      controller.request.xhr? ? 'simple' : 'application' 
    end
  }
  
  def layout_by_resource
    if devise_controller? 
      "login"
    else
      "application"
    end
  end
    
  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?
  
  def set_user_language
    I18n.locale = current_user.language if logged_in?
  end

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

end