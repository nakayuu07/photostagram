class Picture < ActiveRecord::Base
  validates :title, presence: true

   mount_uploader :avatar, AvatarUploader

  belongs_to :user
end
