class BlogPost < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :author
  validates_presence_of :body
end
