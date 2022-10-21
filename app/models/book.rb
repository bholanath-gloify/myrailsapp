class Book < ApplicationRecord
    belongs_to :library
    belongs_to :user

    validates_presence_of :title, :published_at, :language, :library_id, :user_id 
end
