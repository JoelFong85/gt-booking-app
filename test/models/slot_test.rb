require "test_helper"

class SlotTest < ActiveSupport::TestCase

  ## rails test test/models/slot_test.rb 

  ## rails test test/models/slot_test.rb -n test_create_valid_slot
  test "create valid slot" do
    room = rooms(:proper_room)
    new_room = Room.create(name: room.name, status: room.status)
    slot = Slot.create(time: "0900 - 1000", status: true, room_id: new_room.id)

    assert slot.valid?
  end

  ## rails test test/models/slot_test.rb -n test_create_slot_without_time
  test "create slot without time" do
    room = rooms(:proper_room)
    new_room = Room.create(name: room.name, status: room.status)
    slot = Slot.create(status: true, room_id: new_room.id)
    
    assert_not slot.valid?
  end

  ## rails test test/models/slot_test.rb -n test_create_slot_without_room_id
  test "create slot without room id" do
    room = rooms(:incomplete_room)
    new_room = Room.create(name: room.name, status: room.status)
    slot = Slot.create(time: "0900 - 1000", status: true, room_id: new_room.id)

    assert_not slot.valid?
  end
  

end
