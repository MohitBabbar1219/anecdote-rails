class ChangeBodyToBeTextInBlogPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :blog_posts, :body, :text
  end
end
