class RemoveTimeFromVisits < ActiveRecord::Migration[5.2]
  def change
    remove_column :visits, :time, :date
  end
end
