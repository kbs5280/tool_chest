require_relative '../test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "logged in user can logout" do
    user = User.create(username: "rachel", password: "password")

    visit login_path
    fill_in "Username", with: "rachel"
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Welcome, rachel")

    click_link "Logout"

    refute page.has_content?("Welcome, rachel")
  end
end
