require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!
  
describe 'Users' do

  describe "GET /users/sign_up" do
    it "should create a new user account" do
      visit new_user_registration_path
      fill_in "user_email", with: "name@mail.com"
      fill_in "user_password", with: "password1234"  
      expect { click_button "Sign up" }.to change {User.count}.by(1)
    end
  end
end
