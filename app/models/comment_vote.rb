class CommentVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  belongs_to :topic

  after_create :update_score

  protected

    def update_score
      self.comment.user.increment! :comment_karma, 1
      self.comment.increment! :score, 1
    end
end
