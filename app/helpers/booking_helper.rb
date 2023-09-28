module BookingHelper

    def booked_by_user(selected_date, slot, room_id)

        slot_is_booked = Slot.joins(:booked_slot)
                             .where(booked_slots: {on_date: selected_date, slot_id: slot.id, room_id: room_id})
                             .pluck("booked_slots.email")
                             .map{|email| {email: email}}

        slot_is_booked.empty? ? '-' : slot_is_booked[0][:email]

    end #booked_by_user


    def if_already_booked(slot, selected_date, room_id)
        
        if_booked = if_booking_exists(slot.id, selected_date, room_id)

        if_booked.present? ? true : false 

    end #if_already_booked


    def if_booking_exists(slot_id, selected_date, room_id)        
        
        booking_exists =  Slot.joins(:booked_slot)
                     .where(booked_slots: {slot_id: slot_id, on_date: selected_date, room_id: room_id})
                     .pluck("booked_slots.id")

        booking_exists.present? ? true : false

      end #if_booking_exists


    def make_new_booking(booking_params)
        @slot_booked = BookedSlot.create(slot_id: booking_params[:slot_id],
                                          room_id: booking_params[:room_id],
                                          name: booking_params[:name],
                                          email: booking_params[:email],                                          
                                          on_date: booking_params[:selected_date])

        @slot_booked.valid? ? true : false
          
      end #make_new_booking

end