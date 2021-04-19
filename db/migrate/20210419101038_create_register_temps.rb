class CreateRegisterTemps < ActiveRecord::Migration[5.2]
  def change
    create_table :register_temps do |t|

      t.timestamps
    end
  end
end
