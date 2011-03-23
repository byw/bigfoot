class ApplicationController < ActionController::Base
  include InheritedResources::DSL
  protect_from_forgery
  helper_method :current_user

  protected

    def load_resource_for_authorization
      if %w(new create).include? action_name
        build_resource
      elsif %w(show edit update).include? action_name
        resource
      elsif 'index' == action_name
        collection
      end
    end

end
