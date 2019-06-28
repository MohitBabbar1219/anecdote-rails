class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create]

  def index
    render json: Comment.where(blog_post_id: params[:blog_post_id])
  end

  def show
    render json: Comment.find(params[:id])
  end

  def create
    @commentable.comments.create(comment_params)
    head :no_content
  end

  private

  def comment_to_map(comment)
    comment_map = {}
    comment_map['id'] = comment.id
    comment_map['content'] = comment.content
    comment_map['commenter'] = comment.commenter
    comment_map['commentable_id'] = comment.commentable_id
    comment_map['commentable_type'] = comment.commentable_type
    comment_map['threaded_comments'] = []
    comment_map['blog_post_id'] = comment.blog_post_id
    comment_map
  end

  def comment_params
    if params[:comment_id]
      params.require(:comment).permit(:content, :commenter).merge(blog_post_id: @commentable.blog_post_id)
    elsif params[:blog_post_id]
      params.require(:comment).permit(:content, :commenter).merge(blog_post_id: params[:blog_post_id])
    end
  end

  def find_commentable
    if params[:comment_id]
      @commentable = Comment.find(params[:comment_id])
    elsif params[:blog_post_id]
      @commentable = BlogPost.find(params[:blog_post_id])
    end
  end
end
