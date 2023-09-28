class Room < ApplicationRecord
    attr_accessor :select_a_date

    validates :name, presence: true

    has_many :slots
end
