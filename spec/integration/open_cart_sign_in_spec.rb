require 'spec_helper'

describe "Login" do

  it "should not login with invalid credentials" do
    user = create(:admin_user, email: "test@example.com", password: 'secret2')

    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret3'
    click_button 'Login'

    page.should_not have_content("My Account")
  end

  it "should login with existing credentials" do
    user = create(:admin_user, email: "test@example.com", password: 'secret2')

    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret2'
    click_button 'Login'

    page.should have_content("My Account")
  end

end
