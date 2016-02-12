require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    user = { name:  "",
            email: "user@invalid",
            password:              "foo",
            password_confirmation: "bar" }
    assert_no_difference 'User.count' do
      post users_path, user: user
    end
    assert_template 'users/new'
    count = 0
    assert_select 'div#error_explanation ul li', assigns(:user).errors.full_messages.count
  end
end
