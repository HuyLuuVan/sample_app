require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end

  test "login with valid email/invalid password" do get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email:  "Welcome to the Sample App!", password: "invalid" } }

    assert_template 'sessions/new' 
    assert_not flash.empty?
    get root_path
    # assert flash.empty?
    end
end
