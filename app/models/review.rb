class Review < ApplicationRecord
  belongs_to :member
  belongs_to :movie
  has_many :favorites, dependent: :destroy
#1から5段階の間の評価になるよう設定
  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true

  validates :title, presence: true
  validates :content, presence: true

  def favorited_by?(member)
		favorites.where(member_id: member.id).exists?
	end

end
