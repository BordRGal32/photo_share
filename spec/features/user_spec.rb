require 'spec_helper'
require 'pry'




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

feature "the signin process" do
  before :each do
    User.create(:name => 'username', :password => 'password', :password_confirmation => 'password')
  end

  it "signs me in" do
    visit '/sessions/new'
    fill_in :name, :with => 'username'
    fill_in :password, :with => 'password'
    click_button 'Log In'
    expect(page).to have_content 'Logged in!'
  end
end


describe 'edit a user' do
  it 'edits a current user' do
    user = FactoryGirl.create(:user)
    visit edit_user_path(user)
    fill_in :user_name, :with => "New Name"
    click_button "Update User"
    page.should have_content "User has been updated"
  end
end

feature 'user deletes their account' do
  it 'signs a user in and lets them delete their account' do
    user = FactoryGirl.create(:user)

    visit user_path(user)
    click_link "Deactivate Account"
    page.should have_content "User Account Deleted"
  end
end




