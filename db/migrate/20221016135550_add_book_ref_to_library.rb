class AddBookRefToLibrary < ActiveRecord::Migration[5.0]
  def change
    add_reference :libraries, :book, foreign_key: true
  end
end
