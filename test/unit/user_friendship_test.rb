require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
	should belong_to(:user)
	should belong_to(:friend)

	test "that creating a friendship works without raising an exception" do 
		assert_nothing_raised do
			UserFriendship.create user: users(:jason), friend: users(:peter)
		end
	end

	test "that creating a friendship basked on user id and friend id works" do
		UserFriendship.create user_id: users(:jason).id, friend_id: users(:peter).id
		assert users(:jason).friends.include?(users(:peter))
	end
end
