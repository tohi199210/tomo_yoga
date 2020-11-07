class Post < ApplicationRecord

    belongs_to :user
	attachment :image
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :bookmarks, dependent: :destroy

	validates :title, presence: true
	validates :table_content, presence: true
	validates :subtitle, presence: true
	validates :content, presence: true

	def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    def bookmark_by?(user)
    	bookmarks.where(user_id: user.id).exists?
    end

end
