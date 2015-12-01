class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  
  def forem_user
    current_user
  end
  helper_method :forem_user
  
  def after_sign_in_path_for(resource)
    forem.root_path
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
end
