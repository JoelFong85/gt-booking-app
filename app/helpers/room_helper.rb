module RoomHelper
    
    def get_room_list
        Room.all.count > 0 ? Room.all.map{ |room| [room.name, room.id]} : []
    end

end
