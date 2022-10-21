class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_at
      t.string :language

      t.timestamps
    end
  end
end
