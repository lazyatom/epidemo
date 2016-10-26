# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task init: :environment do
  unless ENV['INITIAL_CASES'].to_i > 0
    raise "Specify the start ID as INITIAL_CASES=123"
  end

  raise "Database is not empty!" unless Record.all.empty?

  ENV['INITIAL_CASES'].to_i.times do
    Record.create(source_id: 0, infection_location: :first_floor, age_range: :"30_34", gender: :female)
  end
end
