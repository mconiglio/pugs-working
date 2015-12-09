class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   acts_as_voter
  acts_as_follower
  acts_as_followable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   devise :omniauthable, :omniauth_providers => [:facebook, :twitter]  
   
  has_many :posts
  has_many :comments
  has_many :events
  has_many :locations

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  validates_presence_of :name
  
  geocoded_by :current_sign_in_ip
  after_validation :geocode
  
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
   
   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid, name: auth.info.name).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.avatar = auth.info.image.gsub('http://', 'https://')# assuming the user model has an image
    user.cover = auth.info.image
    remote_avatar_url = auth.info.image.gsub('http://', 'https://')
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
