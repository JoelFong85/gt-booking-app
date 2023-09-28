require "test_helper"

class RoomTest < ActiveSupport::TestCase

  ## rails test test/models/room_test.rb 

  ## rails test test/models/room_test.rb -n test_create_a_valid_room
  test "create a valid room" do    
    room = rooms(:proper_room)
    
    assert room.valid?
  end

  ## rails test test/models/room_test.rb -n test_create_room_without_name
  test "create room without name" do
    room = rooms(:incomplete_room)
    
    assert_not room.valid?
  end

end
