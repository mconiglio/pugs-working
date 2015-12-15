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
  
  geocoded_by :current_sign_in_ip, :address => :location
  after_validation :geocode
  
  reverse_geocoded_by :latitude, :longitude, :address => :location
  after_validation :reverse_geocode

  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
   
   def self.from_omniauth(auth)
    #puts auth.inspect
    user = User.where(email: auth.info.email).first
    if user
      user.update_attribute(:remote_avatar_url, auth.info.image.gsub('http://', 'https://'))
      result = Geocoder.search(user.current_sign_in_ip).first
      addr = [result.city,result.state].compact.join(', ')
      if user.location != addr
        user.location = addr
      end
    else
      user = User.new(name: auth.info.name, email: auth.info.email,
                      password: Devise.friendly_token[0, 20], remote_avatar_url: auth.info.image.gsub('http://', 'https://'))
      result = Geocoder.search(user.current_sign_in_ip).first
      addr = [result.city,result.state].compact.join(', ')
      user.location = addr
      user.skip_confirmation!
      user.save
    end
    user
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
