class CommentVotesController < ApplicationController
  inherit_resources
  actions :create, :destroy
  respond_to :json
  before_filter :require_user, :except => [:show]
  before_filter :load_resource_for_authorization
  authorize_resource

  protected

    def build_resource
      unless @comment_vote
        if @comment = Comment.find(params[:comment_id])
          @comment_vote = super
          @comment_vote.user = current_user
          @comment_vote.comment = @comment
          @comment_vote.topic_id = @comment.topic_id
        end
      end
      @comment_vote
    end
end
