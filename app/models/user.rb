class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  has_many :topics
  has_many :comments
  has_many :comment_votes

  validates :username, :presence => true
  validates_format_of :username, :with => /^[a-z|0-9|-]+$/, :message => 'can only contain letters, numbers, and -'

  def total_karma
    self.comment_karma + self.topic_karma
  end

  def admin?
    self.admin
  end

  def to_param
    self.username
  end
end
