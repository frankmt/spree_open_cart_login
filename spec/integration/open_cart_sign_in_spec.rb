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

  it "should login with open cart credentials" do
    user = create(:admin_user, email: "test@example.com", password: 'doesntmatter', 
                  oc_password: "2db2cde6a6cac9fb040042673b4ce59ab393081d",
                  oc_salt: "2446533eb"
                 )

    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '12345678' #Oc Password according to password and salt provided
    click_button 'Login'

    page.should have_content("My Account")
  end

end
