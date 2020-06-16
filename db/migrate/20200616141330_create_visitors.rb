class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :name
      t.integer :contact_number
      t.string :loc_org

      t.timestamps
    end
  end
end
