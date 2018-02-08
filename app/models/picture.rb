class Picture < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :avatar, AvatarUploader
end
