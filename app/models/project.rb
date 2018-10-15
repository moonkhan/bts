class Project < ApplicationRecord
  has_many :projects_users
  has_many :bugs
  has_and_belongs_to_many :users
  belongs_to :user
  validates :title, presence:true, length: {maximum: 40}
  validates :user_id, presence:true
end
