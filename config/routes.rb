Rails.application.routes.draw do
  resources :blog_posts do
    resources :comments
    get '/threaded_comments', to: 'comments#threaded_comments'
  end

  resources :comments do
    resources :comments
  end
end
