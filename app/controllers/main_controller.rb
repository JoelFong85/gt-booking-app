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
            render turbo_stream: turbo_stream.append("select_room_slots", partial: "main/select_room_slots",
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
            # Rails.logger.debug("XXXXX1a")
            respond_to do |format|
                format.turbo_stream do
                    render turbo_stream: turbo_stream.update("booking_message", "Booked exists, please select another slot.")
                end
            end
    
        else
            # Rails.logger.debug("XXXXX1b")
            make_new_booking
            if @slot_booked.valid?
                respond_to do |format|
                    format.turbo_stream do
                        render turbo_stream: turbo_stream.update("booking_message", "Booking saved successfully!")
                    end
                end
            else
                respond_to do |format|
                    format.turbo_stream do
                        render turbo_stream: turbo_stream.update("booking_message", "#{@slot_booked.errors.full_messages.first}")
                    end
                end
            end
    
        end

    end #make_booking

end