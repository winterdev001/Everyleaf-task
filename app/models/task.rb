class Task < ApplicationRecord
    validates :task_name, presence: true  
    validates :label_name, presence: true  
    # validates :start_date, presence: true  
    # validates :end_date, presence: true 
    # validates :status, presence: true   
end
