require 'rails_helper'
require 'support/controller_macros'
require 'supprtfactory_girl'

RSpec.describe UsersController, type: :controller do
  describe 'GET #front' do
    context 'When user is logged in' do
    with :user
    before do
      sign_in(user)
      get :front
    end
      it {is.expexted.to respond_with :ok}
      it {is.expected.to render_with_layout :application}
      it {is.expected.to render_template :front}
    end
  end
  
  describe 'GET #show' do
    with :user
    before do
      sign_in(user)
      get :show
    end
      it {is.expected.to respond_with :ok}
      it {is.expected.to render_with_layout :application}
      it {is.expected.to render_template :show}
  end
end
