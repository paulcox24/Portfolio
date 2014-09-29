class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  accepts_nested_attributes_for :comments, :reject_if => :all_blank, :allow_destroy => true
  
  validates :title, :author, :body, presence: true  
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/jpg"]
end
