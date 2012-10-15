class Post < ActiveRecord::Base
  attr_accessible :author_id, :title, :content, :location, :price

  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy

  validates :author_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  default_scope order: 'posts.created_at DESC'
end
