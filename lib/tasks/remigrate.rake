namespace :db do
  task :remigrate => :environment do
    ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.drop_table t }
    Rake::Task["db:migrate"].invoke
  end
end

