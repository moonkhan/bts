class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :projects_users
  has_many :projects
  has_many :bugs
  has_and_belongs_to_many :projects
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence:true, length: {maximum: 30}
  validates :user_type, presence:true

end
