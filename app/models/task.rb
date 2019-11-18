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

    has_many :tasks_labels, dependent: :destroy
    has_many :labels, through: :tasks_labels

    def self.search(search)
        if search
            where('status LIKE ? or task_name', "%#{search}%")
        elsif search
            where('task_name LIKE ?', "%#{search1}%")
        elsif search
            where('status LIKE ?', "%#{search2}%")
        else
            order('id desc')
        end
    end
    def self.order_list(sort_order)
        if sort_order == "task_name"
            order(task_name: :desc)
        elsif sort_order == "deadline"
            order(deadline: :asc)
        elsif sort_order == "priority"
            order(priority: :asc)
        else
            order(created_at: :desc)
        end
    end

end
