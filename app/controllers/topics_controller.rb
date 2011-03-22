class TopicsController < ApplicationController
  inherit_resources
  respond_to :html, :json
  belongs_to :category, :optional => true, :finder => :find_by_url_name
  before_filter :require_user, :except => [:index, :show]
  before_filter :load_resource_for_authorization
  authorize_resource

  protected

    def resource
      if action_name == 'show'
        @topic ||= Topic.find(params[:id], :include => {:comments => :user})
        if current_user
          @current_user_votes = {}
          current_user.comment_votes.where(:topic_id => @topic.id).each do |vote|
            @current_user_votes[vote.comment_id] = vote
          end
        end
      else
        super
      end
    end

    def collection
      @categories = Category.all
      @topics ||= end_of_association_chain.includes(:user).
        paginate(:per_page => 10, :page => params[:page])
    end

    def build_resource
      unless @topic
        @topic = super
        @topic.user = current_user
      end
      @topic
    end
end
