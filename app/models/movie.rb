class Movie < ApplicationRecord
  mount_uploader :image_id, ImageUploader
  has_many :reviews, dependent: :destroy
  has_many :tag_relationships, dependent: :destroy
  has_many :tags, through: :tag_relationships
end
