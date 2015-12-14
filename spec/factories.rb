FactoryGirl.define do
    
  factory :account do
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
  
  factory :user do
    name {Faker::User.name }
    email {Faker::Internet.email }
    encrypted_password {Faker::Devise.encrypted_password }
    created_at Date.today
    updated_at Date.today
  end
  
  factory :post do
    with :user
    name {Faker::Post.name}
    content {Faker::Post.content}
  end
  
end