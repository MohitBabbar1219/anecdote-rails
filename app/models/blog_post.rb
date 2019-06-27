class BlogPost < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy

  validates_presence_of :title, :author, :body
end
