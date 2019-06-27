Rails.application.routes.draw do
  resources :blog_posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
