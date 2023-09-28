require "test_helper"

class BookedSlotTest < ActiveSupport::TestCase

    ## rails test test/models/booked_slot_test.rb 


    ## rails test test/models/booked_slot_test.rb -n test_create_valid_booked_slot
    test "create valid booked slot" do
      room = rooms(:proper_room)
      new_room = Room.create(name: room.name, status: room.status)
      slot = slots(:proper_slot)
      new_slot = Slot.create(time: slot.time, status: slot.status, room_id: new_room.id)

      booked_slot = BookedSlot.new(slot_id: new_slot.id, name: "Test Tester", email: "test@test.com", on_date: Date.today, room_id: new_room.id)

      assert booked_slot.valid?
    end
  
    ## rails test test/models/booked_slot_test.rb -n test_create_booked_slot_without_name
    test "create booked slot without name" do
      room = rooms(:proper_room)
      new_room = Room.create(name: room.name, status: room.status)
      slot = slots(:proper_slot)
      new_slot = Slot.create(time: slot.time, status: slot.status, room_id: new_room.id)

      booked_slot = BookedSlot.new(slot_id: new_slot.id, email: "john@example.com", on_date: Date.today, room_id: new_room.id)

      assert_not booked_slot.valid?
    end

    ## rails test test/models/booked_slot_test.rb -n test_create_booked_slot_with_invalid_email
    test "create booked slot with invalid email" do
      room = rooms(:proper_room)
      new_room = Room.create(name: room.name, status: room.status)
      slot = slots(:proper_slot)
      new_slot = Slot.create(time: slot.time, status: slot.status, room_id: new_room.id)
    
      booked_slot = BookedSlot.new(slot_id: new_slot.id, name: "Test Tester", email: "test", on_date: Date.today, room_id: new_room.id)
        
      assert_not booked_slot.valid?
    end
    
end
