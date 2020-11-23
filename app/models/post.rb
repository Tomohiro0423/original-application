class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  
end
