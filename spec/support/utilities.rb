def sign_in
  visit '/sessions/new'
  fill_in :name, :with => "MyString"
  fill_in :password, :with => "MyString"
  click_button 'Log In'
end
