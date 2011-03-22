class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic, :counter_cache => true
  belongs_to :parent, :class_name => "Comment", :foreign_key => "parent_id"

  attr_writer :children, :weight

  def children
    @children ||= []
  end

  def weight
    @weight ||= 0
  end

  def age_in_hours
    (Time.now - self.updated_at) / 3600
  end
  
end
