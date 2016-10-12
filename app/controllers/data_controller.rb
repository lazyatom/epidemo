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
end
