class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.float :temperature
      t.date :time
      t.string :purpose
      t.references :visitor, foreign_key: true, null: false

      t.timestamps
    end
  end
end
