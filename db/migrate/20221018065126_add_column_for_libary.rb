class AddColumnForLibary < ActiveRecord::Migration[5.0]
  def change
    add_column :libraries, :opening_time, :time
    add_column :libraries, :closing_time, :time
  end
end
