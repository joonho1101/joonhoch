class Comment < ActiveRecord::Base
  attr_accessible :commentor_id, :post_id, :content

  belongs_to :commentor, class_name: "User"
  belongs_to :post

  validates :commentor_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'comments.created_at DESC'
end
