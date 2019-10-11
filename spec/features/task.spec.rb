# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'

# On the right side of this RSpec.feature, write the test item name like "task management feature" (grouped by do ~ end)
RSpec.feature "Task management function", type: :feature do
  # In scenario (alias of it), write the processing of the test for each item you want to check.
  scenario "Test task list" do
    Task.create!(task_name: 'task_01', label_name: 'test',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')
    Task.create!(task_name: 'task_02', label_name: 'sample',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')

    visit tasks_path

    expect(page).to have_content 'test'
    expect(page).to have_content 'sample'
  end

  scenario "Test task creation" do
    visit new_task_path
    fill_in 'task[task_name]', :with => 'test'
    fill_in 'task[label_name]', :with => 'sample'
    fill_in 'task[start_date]', :with => '2019-10-5 1:40:00'
    fill_in 'task[status]', :with => 'started'
    fill_in 'task[deadline]', :with => '2019-10-15 5:40:00'
    
    click_on 'Create Task'
    
    expect(page).to have_content'test'
    expect(page).to have_content'sample'
  end

  scenario "Test task details" do
    Task.create!(task_name: 'task_02', label_name: 'sample',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')
    visit '/tasks'  
     
    click_link "Show"

    expect(page).to have_content'sample'
    
  end

  scenario "Test whether tasks are arranged in descending order of creation date" do
    Task.create!( task_name: 'task_01', label_name: 'test1', created_at: '2019-09-30 3:40:00',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')
    Task.create!( task_name: 'task_02', label_name: 'sample1', created_at:'2019-09-30 10:41:00',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')

    Task.all.order("created_at DESC")
  end

  scenario "Test task's deadline  creation" do
    task = Task.create!( task_name: 'task_01', label_name: 'test1', created_at: '2019-09-30 3:40:00',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')
    visit edit_task_path(task.id)
    fill_in 'task[deadline]', :with => '2019-10-5 1:40:00'
    
    click_on 'Update Task'
    
    expect(page).to have_content 'Task was successfully updated'
  end

  scenario "Test whether tasks are arranged in descending order of deadline date" do
    Task.create!( task_name: 'task_01', label_name: 'test1',start_date: '2019-10-5 1:40:00',status: 'not started', deadline: '2019-10-15 5:40:00')
    Task.create!( task_name: 'task_02', label_name: 'sample1',start_date: '2019-10-10 2:40:00',status: 'not started', deadline:'2019-10-16 5:40:00')

    Task.all.order("created_at DESC")
  end
end