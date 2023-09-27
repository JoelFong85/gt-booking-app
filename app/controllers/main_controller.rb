class MainController < ApplicationController

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
        
        Rails.logger.debug("XXXXX1")

    end #make_booking

end