class Movie < ApplicationRecord
  mount_uploader :image_id, ImageUploader
  has_many :reviews, dependent: :destroy
end
