class CreateRegisterPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :register_purposes do |t|

      t.timestamps
    end
  end
end
