require 'spec_helper'
require 'pry'

feature 'add a new photo by a user' do
  it 'adds a photo' do
    user = FactoryGirl.create(:user)
    sign_in
    visit user_path(user)
    fill_in :photo_name, :with => "Neytiri"
    attach_file('photo_image', '/Users/epicodus/Desktop/avatar.jpg')
    click_button "Add Photo"
    page.should have_content "Photo Uploaded"
  end
end
