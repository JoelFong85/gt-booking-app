class MainController < ApplicationController
    include BookingHelper

    def landing_page
        @room = Room.new
    end #landing_page


    def select_room
                
        @selected_date = params[:room][:select_a_date] if params[:room][:select_a_date].present?
                
        @room = Room.new

        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.update("select_room", partial: "main/select_room",        
            locals: {selected_date: @selected_date, room: @room})
          end
        end

    end #select_room


    def select_room_slots        

        @room = Room.find(params[:room][:name])
        @slots = @room.slots
        @selected_date = params[:room][:selected_date]
        @slot = Slot.new
        
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.update("select_room_slots", partial: "main/select_room_slots",
            locals: {selected_date: @selected_date, room: @room, slots: @slots, slot: @slot })
          end
        end

    end #select_room_slots


    def make_booking

        slot = params[:slot] if params[:slot]
        slot_id = slot[:slot_id]
        selected_date = slot[:selected_date]
        room_id = slot[:room_id]

        if if_booking_exists(slot_id, selected_date, room_id) 
            @booking_response_text = "Booking exists, please select another slot."
            @booking_response_text_class = "message_error"
        else    
            make_new_booking(slot)
            if @slot_booked.valid?
                @booking_response_text = "Booking saved successfully!"
                @booking_response_text_class = "message_success"
            else
                @booking_response_text = "Error in booking : #{@slot_booked.errors.full_messages.first}"
                @booking_response_text_class = "message_error"
            end
        end

        respond_to do |format|
            format.turbo_stream do
                render turbo_stream: turbo_stream.update("booking_message", partial: "main/booking_response",
                locals: {booking_response_text: @booking_response_text, booking_response_text_class: @booking_response_text_class})
            end
        end     

    end #make_booking

end