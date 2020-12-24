class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  #mount_uploader :image_id, ImageUploader

  enum role: { member: 0, admin: 1 }
  validates :name, presence: true, length: {maximum: 20, minimum: 1, allow_blank: true}
  validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。', allow_blank: true}

  #ゲストユーザーの作成
  def self.guest
    find_or_create_by!(name:'ゲスト', name_kana:'ゲスト', email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
    end
  end
end
