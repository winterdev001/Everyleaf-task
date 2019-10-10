class Task < ApplicationRecord
    validates :task_name, presence: true  
    validates :label_name, presence: true  
    validates :start_date, presence: true  
    # validates :deadline, presence: true 
    validates :status, presence: true   
    

    def self.search(search)
      if search
          where('task_name LIKE ?', "%#{search}%")
      else
          scoped
      end
    end

end
