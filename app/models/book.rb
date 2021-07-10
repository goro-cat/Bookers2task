class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :book_comments, dependent: :destroy

	def favorited_by?(user)##viewで使用するメゾッド
	  favorites.where(user_id: user.id).exists?
	end
	
	is_impressionable counter_cache: true
	##閲覧数・・Bookモデルでimpressionist(カウント)を使用できるようになる
	##counter_chacheでimpressions_countカラムがupdateされるようにします。
	
	form = Book.create.at_beginning_of_day
	to = (form + 6.day).at_end_of_day
	books = Book.where(created_at: form...to)
	
	
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
