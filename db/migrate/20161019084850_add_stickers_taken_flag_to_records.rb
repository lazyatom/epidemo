class AddStickersTakenFlagToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :stickers_taken, :boolean, default: false
  end
end
