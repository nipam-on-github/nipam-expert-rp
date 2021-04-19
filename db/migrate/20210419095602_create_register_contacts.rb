class CreateRegisterContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :register_contacts do |t|

      t.timestamps
    end
  end
end
