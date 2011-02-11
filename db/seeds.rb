# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require "#{RAILS_ROOT}/spec/factories"

[User].each(&:delete_all)

users = []
users << Factory.create(:user, :username => 'bob')
5.times do
  users << Factory.create(:user)
end

