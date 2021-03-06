Rails.application.routes.draw do
  devise_for :users
  
  # Pages controller
  root to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/search', to: 'pages#search'

  # Profile controller
  get '/profile', to: 'profile#index'
  get '/profile/uploads', to: 'profile#uploads'
  get '/profile/downloads', to: 'profile#downloads'
  get '/profile/likes', to: 'profile#likes'

  # Samples controller
  get '/upload', to: 'samples#new'
  post '/upload', to: 'samples#create'
  get '/samples/:id', to: 'samples#show', as: 'show_sample'
  get '/samples/:id/edit', to: 'samples#edit', as: 'edit_sample'
  patch '/samples/:id/edit', to: 'samples#update'
  delete '/samples/:id', to: 'samples#destroy', as: 'delete_sample'

  # Comments controller
  post '/samples/:sample_id/comments', to: 'comments#create', as: 'sample_comments'
  get '/samples/:sample_id/comments/new', to: 'comments#new', as: 'new_sample_comment'
  get '/samples/:sample_id/comments/:comment_id/edit', to: 'comments#edit', as: 'edit_sample_comment'
  patch '/samples/:sample_id/comments/:comment_id', to: 'comments#update', as: 'update_sample_comment'
  delete '/samples/:sample_id/comments/:comment_id', to: 'comments#destroy', as: 'delete_sample_comment'
  post '/samples/:sample_id/comments/:comment_id/like', to: 'comments#like', as: 'like_sample_comment'
  delete '/samples/:sample_id/comments/:comment_id/unlike', to: 'comments#unlike', as: 'unlike_sample_comment'

  # Creators controller
  get '/creators', to: 'creators#index'
  get '/creators/:username', to: 'creators#show', as: 'creator'

  # Tags controller
  get '/tags/:tag', to: 'tags#show', as: 'show_tag'

  # Downloads controller
  get '/download/sample/:id', to: 'downloads#sample', as: 'download_sample'
  patch '/download/sample/:id', to: 'downloads#link', as: 'download_sample_link'
  get '/download/thankyou', to: 'downloads#thankyou', as: 'download_thankyou'

  # Likes controller
  post '/likes/:sample_id', to: 'likes#create', as: 'like_sample'
  delete '/likes/:sample_id', to: 'likes#destroy', as: 'unlike_sample'

  # Notifications controller
  delete '/notifications/:id', to: 'notifications#destroy', as: 'dismiss_notification'
end
