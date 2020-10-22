class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post
  
  attachment :image

  validates :email, length: {minimum: 3, maximum: 80}
  validates :first_name, length: {minimum: 1,maximum: 20}
  validates :first_name_kana, length: {minimum: 1,maximum: 20}
  validates :last_name, length: {minimum: 1, maximum: 20}
  validates :last_name_kana, length:{minimum: 1, maximum: 20}
  
  def self.full_name(user)
  	user.first_name + " " + user.last_name
  end

  def self.search(search)
    if search
      where(['first_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def active_for_authentication?
      super && (self.is_deleted == false)
    end

end
