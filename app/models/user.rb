class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

    has_many :projects_users
    has_many :projects, through: :projects_users

    validates :username, presence: true, uniqueness: true
end
