class CommentsController < ApplicationController
  inherit_resources
  respond_to :html, :json
  belongs_to :topic, :optional => true
  before_filter :require_user, :except => [:show]
  before_filter :load_resource_for_authorization
  authorize_resource
  
  create! do |success, failure|
    success.html { redirect_to topic_url(@comment.topic, :anchor => "comment_#{@comment.id}") }
  end

  update! do |success, failure|
    success.html { redirect_to topic_url(@comment.topic, :anchor => "comment_#{@comment.id}") }
  end
  
  def destroy
    redirect_to topic_url(resource.topic)
    resource.update_attributes :deleted => true
  end

  protected

    def build_resource
      unless @comment
        @comment = super
        @comment.parent_id = params[:parent_id]
        @comment.user = current_user
      end
      @comment
    end

end
