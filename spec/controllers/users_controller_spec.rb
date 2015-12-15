require 'rails_helper'
require 'support/controller_macros.rb'
require 'support/factory_girl.rb'

RSpec.describe UsersController, type: :controller do
  login_user
 
  describe 'GET #show' do
    with :user
    before do
      #login_user
      
      get :show, id: 1
    end
      it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :show}
  end
  
  describe 'GET #destroy'do
     with :user
    before do
      #login_user
      delete :deactivate, id: 1
    end
      it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :deactivate}
  end
  
  describe 'GET #edit' do
   with :user
    before do
      #login_user
      get :edit, id: 1
    end
      it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :edit}
  end
  
end
