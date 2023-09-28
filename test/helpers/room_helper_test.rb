require 'test_helper'

class RoomHelperTest < ActiveSupport::TestCase
  include RoomHelper

  ## rails test test/helpers/room_helper_test.rb 

  ## rails test test/helpers/room_helper_test.rb -n test_get_room_list_returns_room_list
  test "get_room_list returns room list" do    
    room1 = Room.create(name: "Quartz", status: true)
    room2 = Room.create(name: "Obsidian", status: true)
    
    room_list = get_room_list

    assert_includes room_list, ["Quartz", room1.id]
    assert_includes room_list, ["Obsidian", room2.id]
  end

  ## rails test test/helpers/room_helper_test.rb -n test_get_room_list_returns_empty_array
  test "get_room_list returns empty array" do
    Room.delete_all

    room_list = get_room_list

    assert_empty room_list
  end
end
