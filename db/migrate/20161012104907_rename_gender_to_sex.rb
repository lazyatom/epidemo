class RenameGenderToSex < ActiveRecord::Migration[5.0]
  def change
    rename_column :records, :gender, :sex
  end
end
