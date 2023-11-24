class RenameTraductionToTranslateInWords < ActiveRecord::Migration[7.0]
  def change
    rename_column :words, :traduction, :translate
  end
end