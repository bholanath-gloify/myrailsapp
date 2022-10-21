class AddLibraryRefToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :library, foreign_key: true
    add_reference :books, :user, foreign_key: true
  end
end
