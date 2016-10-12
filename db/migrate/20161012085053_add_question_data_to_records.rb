class AddQuestionDataToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :gender, :integer, default: 0
    add_column :records, :age_range, :integer, default: 0
    add_column :records, :infection_location, :integer, default: 0
  end
end
