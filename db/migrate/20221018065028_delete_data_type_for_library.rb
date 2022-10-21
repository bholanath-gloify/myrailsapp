class DeleteDataTypeForLibrary < ActiveRecord::Migration[5.0]
  def change
    remove_column :libraries, :opening_time, :string
    remove_column :libraries, :closing_time, :string
  end
end
