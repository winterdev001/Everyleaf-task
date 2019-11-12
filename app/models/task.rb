class Task < ApplicationRecord
    validates :task_name, presence: true ,uniqueness: true 
    validates :label_name, presence: true  
    validates :start_date, presence: true  
    validates :deadline, presence: true 
    # validates :status, presence: true   
    

    # def self.search(search)
    #   if search
    #       where('task_name || status LIKE ?', "%#{search}%")
    #   else
    #       scoped
    #   end
    # end

    paginates_per 4
    belongs_to :user

end
