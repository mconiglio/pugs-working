require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
    
  it "blocks unauthenticated access" do
    sign_in nil

    get :front

    expect(response).to redirect_to('/')
  end

  it "allows authenticated access" do
    sign_in

    get :front

    expect(response).to be_success
  end
  
end
