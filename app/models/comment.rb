class Comment < ActiveRecord::Base
  attr_accessible :author, :content, :post_id

  belongs_to :post

  validates :author, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :post_id, presence: true

  default_scope order: 'comments.created_at DESC'
end
