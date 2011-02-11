class UserSessionsController < ApplicationController
  inherit_resources
  actions :new, :create, :destroy

  create! do |success|
    success.html { redirect_back_or_default '/' }
  end
end
