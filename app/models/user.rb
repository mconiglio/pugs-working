class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_follower
  acts_as_followable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   devise :omniauthable, :omniauth_providers => [:facebook, :twitter]      
   
   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, name: auth.info.name).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
    end
   end
   
   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"] if user.name.blank?
      end
      if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
          user.name = data["name"] if user.name.blank?
      end
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
          user.name = data["name"] if user.name.blank?
      end
    end
   end
        
end
