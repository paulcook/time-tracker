require "acceptance_test_helper"

describe "User can login Acceptance Test" do

  it "should allow user to login" do
    user = FactoryGirl.create(:user)
    
    visit "/"
    fill_in "Email", with: user.email
    fill_in "Password", with: "testpass"
    click_button "Sign in"
    
    assert page.has_content? ("Logged in as #{user.name}")
  end
end