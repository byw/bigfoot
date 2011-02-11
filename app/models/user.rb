class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  
  acts_as_authentic do |config|
    config.merge_validates_format_of_login_field_options :with => /\A\w[\w\-\d]+$/,
      :message => I18n.t('error_messages.login_invalid', 
                         :default => "should use only letters, numbers, spaces, _ , and -")
    config.merge_validates_length_of_email_field_options :allow_blank => true
    config.merge_validates_uniqueness_of_email_field_options :allow_blank => true
    config.merge_validates_format_of_email_field_options :allow_blank => true
  end

  def admin?
    #pending
    false
  end

  def to_param
    self.username
  end
end
