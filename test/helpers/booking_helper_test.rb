require 'test_helper'
# require 'logger'


class BookingHelperTest < ActiveSupport::TestCase
	include BookingHelper

	# def setup
	# 	@logger = Logger.new('test.log')
	# 	@logger.level = Logger::DEBUG
	# end

	# @logger.info("XXXXX1: #{selected_date.inspect}")
	
	
	
	## rails test test/helpers/booking_helper_test.rb



	##### booked_by_user

	## rails test test/helpers/booking_helper_test.rb -n test_booked_by_user_returns_user_email_when_slot_booked
	test "booked_by_user returns user email when slot booked" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)

		booked_slot = BookedSlot.create(slot_id: slot.id, room_id: room.id, name: "Tester Testing", email: "test@test.com", on_date: selected_date)

		result = booked_by_user(selected_date, slot, room.id)

		assert_equal "test@test.com", result
	end

	## rails test test/helpers/booking_helper_test.rb -n test_booked_by_user_returns_dash_when_slot_not_booked
	test "booked_by_user returns dash when slot not booked" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)

		result = booked_by_user(selected_date, slot, room.id)

		assert_equal "-", result
	end



	##### if_already_booked

	## rails test test/helpers/booking_helper_test.rb -n test_if_already_booked_returns_true_when_slot_is_booked
	test "if_already_booked returns true when slot is booked" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)
		
		booked_slot = BookedSlot.create(slot_id: slot.id, room_id: room.id, name: "Tester Testing", email: "test@test.com", on_date: selected_date)
		
		result = if_already_booked(slot, selected_date, room.id)

		assert_equal true, result
	end

	## rails test test/helpers/booking_helper_test.rb -n test_if_already_booked_returns_false_when_slot_is_not_booked
	test "if_already_booked returns false when slot is not booked" do
		selected_date = Date.today
		room = rooms(:proper_room)		
		slot = slots(:proper_slot)	

		result = if_already_booked(slot, selected_date, room.id)
		
		assert_equal false, result
	end



	##### if_booking_exists

	## rails test test/helpers/booking_helper_test.rb -n test_if_booking_exists_returns_true_when_booking_exists
	test "if_booking_exists returns true when booking exists" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)	
		
		booked_slot = BookedSlot.create(slot_id: slot.id, room_id: room.id, name: "Tester Testing", email: "test@test.com", on_date: selected_date)

		result = if_booking_exists(slot.id, selected_date, room.id)

		assert_equal true, result
	end

	## rails test test/helpers/booking_helper_test.rb -n test_if_booking_exists_returns_false_when_no_booking_exists
	test "if_booking_exists returns false when no booking exists" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)	
		
		result = if_booking_exists(slot.id, selected_date, room.id)

		assert_equal false, result
	end


	
	##### make_new_booking

	## rails test test/helpers/booking_helper_test.rb -n test_make_new_booking_return_true_for_success
	test "make_new_booking return true for success" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)
		booked_slot = booked_slots(:proper_booked_slot)

		slot_params = {
			slot_id: slot.id,
			room_id: room.id,
			name: booked_slot.name,
			email: booked_slot.email,
			selected_date: selected_date
		}
		
		result = make_new_booking(slot_params)

		assert_equal true, result

		booked_slot = BookedSlot.find_by(slot_id: slot_params[:slot_id], room_id: slot_params[:room_id], on_date: slot_params[:selected_date])
		assert_not_nil booked_slot
	end

	## rails test test/helpers/booking_helper_test.rb -n test_make_new_booking_fail_no_email
	test "make_new_booking fail no email" do
		selected_date = Date.today
		room = rooms(:proper_room)
		slot = slots(:proper_slot)
		booked_slot = booked_slots(:no_email_booked_slot)

		slot_params = {
			slot_id: slot.id,
			room_id: room.id,
			name: booked_slot.name,
			email: booked_slot.email,
			selected_date: selected_date
		}		

		result = make_new_booking(slot_params)		

		assert_equal false, result

		new_booked_slot = BookedSlot.find_by(slot_id: slot_params[:slot_id], room_id: slot_params[:room_id], on_date: slot_params[:selected_date])

		assert_nil new_booked_slot
	end

end
