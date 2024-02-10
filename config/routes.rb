# == Route Map
#
#                          Prefix Verb     URI Pattern                         Controller#Action
#                            root GET      /                                   posts#index
#                new_user_session GET      /login(.:format)                    devise/sessions#new
#                    user_session POST     /login(.:format)                    devise/sessions#create
#            destroy_user_session DELETE   /logout(.:format)                   devise/sessions#destroy
# user_twitter_omniauth_authorize GET|POST /auth/twitter(.:format)             omniauth_callbacks#passthru
#  user_twitter_omniauth_callback GET|POST /auth/twitter/callback(.:format)    omniauth_callbacks#twitter
#               new_user_password GET      /password/new(.:format)             devise/passwords#new
#              edit_user_password GET      /password/edit(.:format)            devise/passwords#edit
#                   user_password PATCH    /password(.:format)                 devise/passwords#update
#                                 PUT      /password(.:format)                 devise/passwords#update
#                                 POST     /password(.:format)                 devise/passwords#create
#        cancel_user_registration GET      /cancel(.:format)                   registrations#cancel
#           new_user_registration GET      /registration(.:format)             registrations#new
#          edit_user_registration GET      /profile(.:format)                  registrations#edit
#               user_registration PATCH    /                                   registrations#update
#                                 PUT      /                                   registrations#update
#                                 DELETE   /                                   registrations#destroy
#                                 POST     /                                   registrations#create
#                           users GET      /users(.:format)                    users#index
#                            user GET      /users/:id(.:format)                users#show
#                     post_photos POST     /posts/:post_id/photos(.:format)    photos#create
#                      post_likes POST     /posts/:post_id/likes(.:format)     likes#create
#                            like DELETE   /likes/:id(.:format)                likes#destroy
#                   post_comments GET      /posts/:post_id/comments(.:format)  comments#index
#                                 POST     /posts/:post_id/comments(.:format)  comments#create
#                         comment DELETE   /comments/:id(.:format)             comments#destroy
#                  post_bookmarks POST     /posts/:post_id/bookmarks(.:format) bookmarks#create
#                        bookmark DELETE   /bookmarks/:id(.:format)            bookmarks#destroy
#                           posts GET      /posts(.:format)                    posts#index
#                                 POST     /posts(.:format)                    posts#create
#                            post GET      /posts/:id(.:format)                posts#show
#                                 DELETE   /posts/:id(.:format)                posts#destroy

Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users,
    path: '',
    path_names: {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
    controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

  # get '/users/:id', to: 'users#show'
  # /users/3 -> Users controller, show action, params {id: '3'}
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
    resources :bookmarks, only: [:create, :destroy], shallow: true
  end
end
