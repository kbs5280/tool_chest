require_relative '../test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "rachel", password: "password")

    visit login_path
    fill_in "Username", with: "rachel"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, rachel")
  end

  test "user cannot login without valid password" do
    user = User.create(username: "rachel", password: "password")

    visit login_path
    fill_in "Username", with: "rachel"
    fill_in "Password", with: "assword"
    click_button "Login"

    assert page.has_content?("Login")
  end
end
