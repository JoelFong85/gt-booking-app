class BookedSlot < ApplicationRecord
    validates :slot_id, presence: true
    validates :room_id, presence: true
    validates :on_date, presence: true
    validates :name, presence: true
    validates :email, presence: true, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }
    belongs_to :slot
end
