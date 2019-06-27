class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates_presence_of :commenter
  validates_presence_of :content
  validates_presence_of :commentable_id
  validates_presence_of :commentable_type
end
