class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
    render json: @blog_posts
  end

  def show
    @blog_post = find_blog
    render json: @blog_post
  end

  def create
    @blog_post = BlogPost.create!(blog_params)
    render json: @blog_post, status: :created
  end

  def update
    @blog_post = find_blog
    @blog_post.update(blog_params)
    render json: @blog_post, status: :accepted
  end

  def destroy
    @blog_post = find_blog
    @blog_post.destroy
    head :no_content
  end

  private

  def blog_params
    params.permit(:title, :author, :body)
  end

  def find_blog
    BlogPost.find(params[:id])
  end
end
