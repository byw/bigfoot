class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  def preloaded_comments
    children_of = {}
    for comment in self.comments
      children_of[comment.parent_id] ||= []
      children_of[comment.parent_id] << comment
    end
    for comment in self.comments
      comment.children = children_of[comment.id]
    end
    roots = children_of[nil] || []
    roots.each {|comment| sort_comment_tree(comment)}
    roots.sort! {|x, y| y.weight <=> x.weight}
  end

  protected

    def sort_comment_tree(node)
      sum = 0
      for child in node.children
        sum += sort_comment_tree(child)
      end

      node.children.sort! {|x, y| y.weight <=> x.weight}

      node_individual_rating = ((node.score + 1) / (comments_frequency * node.age_in_hours))
      # average of own rating & those of the children
      node.weight = (node_individual_rating + sum) / (node.children.size + 1)
    end

    def comments_frequency
      self.comments_count / self.age_in_hours
    end
    
    def age_in_hours
      (Time.now - self.updated_at) / 3600
    end
end
