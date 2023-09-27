# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


names = ["Diamond", "Ruby", "Zirconia"]

names.each do |name|
    Room.create(name: name, status: true)
end

slots = ["0800 - 0900", "0900 - 1000", "1000 - 1100", "1100 - 1200", "1200 - 1300", "1300 - 1400", "1400 - 1500", "1500 - 1600", "1700 - 1800"]
Room.all.each do |room|
 slots.each do |slot|
    Slot.create(room_id: room.id, time: slot, status: true)
 end
end