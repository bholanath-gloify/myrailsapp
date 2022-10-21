class CreateLibraries < ActiveRecord::Migration[5.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :opening_time
      t.string :closing_time

      t.timestamps
    end
  end
end
