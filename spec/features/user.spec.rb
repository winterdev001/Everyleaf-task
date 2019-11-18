
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
   visit admin_user_path(id: @user.id)
   expect(page).to have_content('winter@gmail.com')
 end

 scenario 'Testing of user Deletion' do
   User.create!(name: 'winter', email: 'winter@gmail.com', password: 'winter')
   @user = User.last
   
    assert @user.destroy
 end

 scenario "test task search by atached labels " do
    visit  new_session_path
    fill_in  'Email' ,  :with => 'winter@gmail.com'  
    fill_in  'Password' ,  :with => 'winter123'
    click_on  'Log in'
    visit new_label_path
    fill_in 'Name', with: 'label1 '
    fill_in 'Content', with: 'content1 '
    click_on 'Create Label'
    visit new_label_path
    fill_in 'Name', with: 'label1 '
    fill_in 'Content', with: ' content2'
    click_on 'Create Label'
    @task = Task.first
    @label1 = Label.first
    @label2 = Label.last
    visit tasks_path
    fill_in  'search3' ,  with: 'label1'
    click_on 'search by label'

  end

  scenario "Test user list" do
   user=User.all
   assert user   
   expect(page ).to  have_content  'dev'
 end

end


