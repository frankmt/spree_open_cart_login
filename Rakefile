require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/extension_rake'

RSpec::Core::RakeTask.new

task :default => [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_open_cart_login'
  Rake::Task['extension:test_app'].invoke
end

require 'json'

namespace :data do

  desc 'Load OpenCart users data'
  task :load_user_data => :environment do
    users_data = File.open('import_data/user_data.json').read
    users = JSON.parse(users_data) 

    users.each do |user|
      pp user
    end
  end

end
