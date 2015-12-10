require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    login_user
    
    it "should have current_user"do
        subject.current_user.should_not be_nil
    end
    
    it "should get front" do
        get "front"
        response.should be_success
    end
    
end
