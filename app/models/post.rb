class Post < ActiveRecord::Base
  #include Shared::Callbacks

  belongs_to :user
  counter_culture :user
  acts_as_votable
  acts_as_commentable
  has_one :location, :through => :user
  
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| model.user }

  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AvatarUploader


  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :when
  validates_presence_of :content
  
  auto_html_for :content do
    html_escape
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end
end
