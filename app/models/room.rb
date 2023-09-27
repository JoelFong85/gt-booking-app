class Room < ApplicationRecord
    attr_accessor :select_a_date

    has_many :slots
end
