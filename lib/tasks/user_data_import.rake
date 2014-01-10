require 'json'

namespace :data do

  desc 'Load YourGrocer Users Data'
  task :load_user_data => :environment do
    users_data = File.open('import_data/user_data.json').read
    users = JSON.parse(users_data) 

    users.each do |user|
      pp user
    end

  end

end
