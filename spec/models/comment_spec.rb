require 'rails_helper'
require 'support/controller_macros.rb'

RSpec.describe Comment, type: :model do

  describe "comment" do
    it "creates correctly" do 
      user = User.create!(name: "ExampleUser", email: "test3@newmail.com", password: "password")
      commentable = Post.find(1)
      comment = commentable.comments.create(comment: 'test comment', commentable_type: 'Post', commentable_id: 3)
      expect(comment).to be_valid
    end

    it "destroy correctly" do 
      comment = Comment.find(1)
      sign_in(comment.user)
      expect { comment.destroy }.to change(Comment, :count)
    end

    it "doesn't destroy correctly" do 
      comment = Comment.find(1)
      user = User.create!(name: "AnotherUser", email: "test4@newmail.com", password: "password")
      sign_in(user)
      expect { comment.destroy }.not_to change(Comment, :count)
    end
  end
end
