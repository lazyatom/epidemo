class AddScannedByToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :scanned_by, :string
  end
end
