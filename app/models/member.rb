class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  enum role: { member: 0, admin: 1 }
  validates :name, presence: true, length: {maximum: 20, minimum: 1, allow_blank: true}
  validates :name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。', allow_blank: true}

  def favorited_by?(member)
		favorites.where(member_id: member.id).exists?
  end

end
