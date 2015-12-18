require 'rails_helper'
require 'support/controller_macros.rb'
require 'support/factory_girl.rb'

RSpec.describe CommentsController, type: :controller do
  login_user
 
  describe 'POST #create' do
    with :comment
    before do
      post :create, "/comments", { comment_text: 'test comment', commentable_type: 'Post', commentable_id: 3 }
    end
    it {is_expected.to respond_with :ok}
    it {is_expected.to render_with_layout :application}
  end
  
  describe 'GET #destroy'do
    with :comment
    before do
      delete :destroy, id: 1
    end
    it {is_expected.to respond_with :ok}
    it {is_expected.to render_with_layout :application}
  end
end
