class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, :author, :body, presence: true  
end
