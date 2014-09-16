class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true
  validates :title, :author, :body, presence: true  
end
