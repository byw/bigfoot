class UsersController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => [:new, :create, :index, :show]
  before_filter :load_resource_for_authorization
  authorize_resource

  create! do |success|
    success.html { redirect_back_or_default user_url(@user) }
  end
  protected
    
    def build_resource
      # users aren't allowed to change usernames afterwards
      unless @user
        @user = super
        @user.username = params[:user][:username] if params[:user]
      end
      @user
    end

    def resource
      @user ||= User.find_by_username(params[:id])
    end
end
