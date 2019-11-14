
require 'rails_helper'
RSpec.feature "user management function", type: :feature do
 background do
   User.create!(name: "dev", email: 'dev@gmail.com',  password: 'dev123')
   visit  new_session_path
   fill_in  'Email' ,  :with => 'dev@gmail.com'  
   fill_in  'Password' ,  :with => 'dev123'
   click_on  'Log in'
 end 	

 scenario "Test user creation" do
   User.create!(name: 'Winter', email: 'winter@gmail.com', password: 'winter123')
   user=User.last
   expect(user.name).to match("Winter")
 end

 scenario "Test user details" do
   @user= User.create!(name: 'dev', email: 'winter@gmail.com', password: 'dev123')
   visit user_path(id: @user.id)
   expect(page).to have_content('dev@gmail.com')
 end

end


