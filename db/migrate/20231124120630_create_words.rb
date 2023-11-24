class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :name
      t.text :traduction
      t.integer :hit
      t.integer :error

      t.timestamps
    end
  end
end
