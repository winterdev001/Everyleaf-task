require 'rails_helper'

RSpec.describe Task, type: :model do

  it "Validation does not pass if the task name is empty" do
    task = Task.new(id: 1 ,task_name: '', label_name: 'Failure test', start_date: '2019-09-10 00:00:00 +0100', end_date: '2019-09-20 00:00:00 +0100', status: 'started', created_at: '2019-09-10',updated_at:'2019-09-20')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if label name is empty" do
    task = Task.new(id: 1 ,task_name: 'hello', label_name: '', start_date: '2019-09-10 00:00:00 +0100', end_date: '2019-09-20 00:00:00 +0100', status: 'started', created_at: '2019-09-10',updated_at:'2019-09-20')
    expect(task).not_to be_valid
  end

  it "validation passes If content is described in title and content" do
    task = Task.new(id: 1 ,task_name: 'hello', label_name: 'Failure test', start_date: '2019-09-10 00:00:00 +0100', end_date: '2019-09-20 00:00:00 +0100', status: 'started', created_at: '2019-09-10',updated_at:'2019-09-20')
    expect(task).to be_valid
  end
end