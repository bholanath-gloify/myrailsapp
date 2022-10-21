class Library < ApplicationRecord
    has_many :books

    validates_presence_of :name, :opening_time, :closing_time
end
