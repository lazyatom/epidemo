# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task init: :environment do
  unless ENV['START_ID'].to_i > 0
    raise "Specify the start ID as START_ID=123"
  end
  Record.connection.execute("ALTER SEQUENCE records_id_seq RESTART #{ENV['START_ID']}")
end
