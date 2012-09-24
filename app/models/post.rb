class Post < ActiveRecord::Base
  attr_accessible :content, :created_date, :location, :price, :title

  has_many :comments

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
