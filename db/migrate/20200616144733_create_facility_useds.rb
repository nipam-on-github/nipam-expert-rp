class CreateFacilityUseds < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_useds do |t|
      t.string :facility
      t.references :visit, foreign_key: true, null: false

      t.timestamps
    end
  end
end
