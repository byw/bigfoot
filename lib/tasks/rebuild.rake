namespace :db do
  task :rebuild => :environment do
    ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.drop_table t }
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end
end

