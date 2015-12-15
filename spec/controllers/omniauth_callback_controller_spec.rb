require 'rails_helper'
require 'support/controller_macros.rb'
require 'support/factory_girl.rb'


RSpec.describe Users::OmniauthCallbacksController, type: :controller do
 
 describe "Facebook Log in" do
   before do
     request.env["devise.mapping"] = Devise.mappings[:user]
     visit new_user_registration_path
     set_omniauth_facebook()
     
     click_link_or_button "Sign in with Facebook"
   end
      it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :front}
 end
 
 describe "Twitter Log in" do
   before do
    request.env["devise.mapping"] = Devise.mappings[:user]
     visit new_user_registration_path
     set_omniauth_twitter()
     click_link_or_button "Sign in with Twitter"
   end
      it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :front}
 end
  
end
