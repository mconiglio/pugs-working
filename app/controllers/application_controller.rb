class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def location
  if params[:location].blank? || params[:location] == nil
    if Rails.env.test? || Rails.env.development?
      @location ||= Geocoder.search("50.78.167.161").first.city
    else
      @location ||= request.location.city
    end
  else
    params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
    @location ||= Geocoder.search(params[:location]).first
    @location
  end
  end
  
  def address
     [city,state].compact.join(', ')
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :password_confirmation]
    devise_parameter_sanitizer.for(:sign_in) << [:email, :remember_me]
  end
    include PublicActivity::StoreController
end
