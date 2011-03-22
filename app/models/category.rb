class Category < ActiveRecord::Base
  has_many :topics

  before_save :generate_url_name

  def to_param
    self.url_name
  end

  protected

    def generate_url_name
      self.url_name = self.name.downcase.gsub(/[^a-z0-9\s-]/, '') #get rid of invalid chars
      self.url_name = self.url_name.gsub(/\s+/, ' ').strip #convert multiple spaces into a single space
      self.url_name = self.url_name.gsub(/\s/, '-') #hyphens for spaces
    end
      
end
