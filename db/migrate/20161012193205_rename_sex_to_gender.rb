class RenameSexToGender < ActiveRecord::Migration[5.0]
  def change
    rename_column :records, :sex, :gender
  end
end
