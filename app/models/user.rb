class User < ApplicationRecord
    has_many :tasks , dependent: :destroy
    validates :name, presence: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :email, presence: true, length: {maximum: 255}, 
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true

    before_save { self.email = email.downcase }
    has_secure_password

    def self.admins
        @users = User.all
        @admins=0
        @users.each do |user|
            if user.role?
                @admins += 1
            end
        end
    return @admins
    end

    has_many :labels, dependent: :destroy
end
