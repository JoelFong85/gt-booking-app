module BookingHelper

    def booked_by_user(selected_date, slot, room_id)

        slot_is_booked = Slot.joins(:booked_slot)
                             .where(booked_slots: {on_date: selected_date, slot_id: slot.id, room_id: room_id})
                             .pluck("booked_slots.email")
                             .map{|email| {email: email}}

        Rails.logger.debug("XXXXX4: #{slot_is_booked.inspect}")

        slot_is_booked.empty? ? '-' : slot_is_booked[0][:email]

    end #booked_by_user

end