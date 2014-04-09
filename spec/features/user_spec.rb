require 'spec_helper'

feature "creates a new user" do
  it 'creates a new user' do
    visit new_user_path
    fill_in :user_name, :with => "Lauren"
    fill_in :user_password, :with => "abc123"
    fill_in :user_password_confirmation, :with => "abc123"
    click_button "Create User"
    page.should have_content "Thank you for signing up!"
  end
end
