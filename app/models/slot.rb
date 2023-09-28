class Slot < ApplicationRecord
    attr_accessor :slot_id, :name, :email

    validates :time, presence: true

    belongs_to :room
    has_one :booked_slot , dependent: :destroy
end
