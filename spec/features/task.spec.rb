# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.zz
  background do
   User.create!(name: "winter", email: 'winter@gmail.com',  password: 'winter123')
  end
 
  scenario "Test of task list" do
    visit new_task_path
    @user=User.first
  Task.create!(task_name: "hello", label_name: "hellohello",start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High', user_id: @user.id)
  Task.create!(task_name: "hi", label_name: "hihi",start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High',user_id: @user.id)
    visit tasks_path
  end

  scenario "Test of task creation" do
    @user=User.first
    Task.create!(task_name: "hello", label_name: "hellohello",start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High', user_id: @user.id)
    visit tasks_path
    expect(page).to have_content ''
  end

  scenario "Test of task details" do
    task1=Task.first  
  end

  scenario "Test whether tasks are arranged in descending order of the creation date" do
    visit tasks_path
    assert Task.all.order("created_at DESC")
  end  

  scenario "Test whether tasks are arranged in descending order of deadline date" do
    visit tasks_path
    assert Task.all.order("deadline DESC")
  end

  scenario "Search by title" do
    visit  new_session_path
    fill_in  'Email' ,  :with => 'winter@gmail.com'  
    fill_in  'Password' ,  :with => 'winter123'
    click_on  'Log in'
    @user=User.first
    Task.create!(task_name: "hello", label_name: "hellohello",start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High', user_id: @user.id)
    visit tasks_path    
    expect(page).to have_content "hello"
  end

  scenario "Search by status" do
    visit  new_session_path
    fill_in  'Email' ,  :with => 'winter@gmail.com'  
    fill_in  'Password' ,  :with => 'winter123'
    click_on  'Log in'
    @user=User.first
    Task.create!( task_name: 'task_01', label_name: 'test1',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High',user_id: @user.id)
    visit tasks_path
    fill_in "Search by Status" , :with =>"not started"
    expect(page).to have_content "not started"
  end

  scenario "Search by title or status" do
    visit  new_session_path
    fill_in  'Email' ,  :with => 'winter@gmail.com'  
    fill_in  'Password' ,  :with => 'winter123'
    click_on  'Log in'
    @user=User.first
    Task.create!( task_name: 'task_01', label_name: 'test1',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00' , priority: 'High',user_id: @user.id)
    visit tasks_path
    fill_in "Search by Task_name or Status" , :with =>"task_01"
    expect(page).to have_content "task_01"
  end

  scenario "Test whether tasks are arranged in Ascending order of Priority" do
    visit tasks_path
    assert Task.all.order("priority ASC")
  end
end