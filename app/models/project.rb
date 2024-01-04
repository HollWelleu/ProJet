class Project < ApplicationRecord

    has_many :projects_users
    has_many :users, through: :projects_users

    attr_accessor :user_ids

end
