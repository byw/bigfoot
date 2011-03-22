class User < ActiveRecord::Base
  has_many :topics
  has_many :comments
  has_many :comment_votes

  attr_accessible :email, :password, :password_confirmation
  
  acts_as_authentic do |config|
    config.merge_validates_format_of_login_field_options :with => /\A\w[\w\-\d]+$/,
      :message => I18n.t('error_messages.login_invalid', 
                         :default => "should use only letters, numbers, spaces, _ , and -")
    config.merge_validates_length_of_email_field_options :allow_blank => true
    config.merge_validates_uniqueness_of_email_field_options :allow_blank => true
    config.merge_validates_format_of_email_field_options :allow_blank => true
  end

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
