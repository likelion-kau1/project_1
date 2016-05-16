class Post < ActiveRecord::Base
    has_many :comments
    validates :title, presence: { message: "게시물 제목을 입력하세요." }
end