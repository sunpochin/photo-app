class Image < ApplicationRecord
  # belongs_to :user, :optional => true
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
