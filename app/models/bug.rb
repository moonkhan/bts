class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  mount_uploader :screenshot, ScreenshotUploader
  validates :title, presence:true, length: {maximum: 40}
  validates :status, presence:true
  validates :type, presence:true
end
