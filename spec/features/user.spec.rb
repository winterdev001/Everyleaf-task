
require 'rails_helper'
RSpec.feature "user management function", type: :feature do 

 scenario "Test user creation" do
   User.create!(name: 'Winter', email: 'winter@gmail.com', password: 'winter123')
   user=User.last
   expect(user.name).to match("Winter")
 end

  scenario "Test of user login after registration " do
    visit new_user_path
    fill_in "Name" , with: "dev"
    fill_in "Email", with: "dev@gmail.com"
    fill_in "Password", with: "dev123"
    fill_in "user[password_confirmation]", with: "dev123"
    click_on "Register"

    expect(page).to have_content('EVERYLEAF Ltd')
  end

 scenario "Test of user log in" do
  User.create!(name: "dev", email: 'dev@gmail.com',  password: 'dev123')
   visit  new_session_path
   fill_in  'Email' ,  :with => 'dev@gmail.com'  
   fill_in  'Password' ,  :with => 'dev123'
   click_on  'Log in'
   expect(page).to have_content('EVERYLEAF Ltd')
 end

 scenario "redirect when user not logged in " do
  visit tasks_path
  expect(page).to have_content "can't access this page unless logged in"
 end
end

RSpec.feature "user management function/logged in functions", type: :feature do
  background do
   User.create!(name: "dev", email: 'dev@gmail.com',  password: 'dev123')
   visit  new_session_path
   fill_in  'Email' ,  :with => 'dev@gmail.com'  
   fill_in  'Password' ,  :with => 'dev123'
   click_on  'Log in'
 end 	
  scenario "restrict users to access sign up page while logged in" do
    visit new_user_path
    expect(page).to have_content "can't access this page unless logged out"
  end

  scenario "display users task only" do
    User.create!(name: 'winter', email: 'winter@gmail.com', password: 'winter')
    user=User.first
    @task=    Task.create!(task_name: "holla", label_name: "hellohello",start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High', user_id: user.id)
    expect(@task.task_name).to match("holla")
  end

  scenario "Test user details" do
   @user= User.create!(name: 'dev', email: 'winter@gmail.com', password: 'dev123')
   visit user_path(id: @user.id)
   expect(page).to have_content('dev@gmail.com')
 end
end

