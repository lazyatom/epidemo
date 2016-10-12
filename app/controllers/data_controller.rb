require 'csv'

class DataController < ApplicationController
  def index
    column_names = Record.column_names
    csv_data = CSV.generate do |csv|
      csv << column_names
      Record.find_each do |record|
        csv << record.attributes.values_at(*column_names)
      end
    end
    send_data csv_data, filename: 'epidemo.csv'
  end

  def simulation
    sim_params = {
      number_of_initial_cases: params.fetch(:number_of_initial_cases, 10).to_i,
      number_of_stickers: params.fetch(:number_of_stickers, 3).to_i
    }
    s = Simulation.new(sim_params)
    Random.srand(params.fetch(:seed, 123456).to_i)
    s.run(interaction_count: [10000, params.fetch(:number_of_iterations, 1000).to_i].min)
    send_data s.data, filename: 'epidemo-simulation.csv'
  end
end

