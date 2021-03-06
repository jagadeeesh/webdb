Webdb::Application.routes.draw do
resources  :posts
resources  :users
resources :sessions, only: [:new, :create, :destroy]
root 'users#home'
#match '/show_post' , to: 'posts#show' , via: 'get'
match '/signin' , to: 'sessions#new' , via: 'get'
 match '/signout', to: 'sessions#destroy', via: 'delete'
match '/signup', to: 'users#new',    via: 'get'
match '/store', to: 'posts#new',    via: 'get'
match '/key', to: 'posts#key',    via: 'get'
match '/:id:key', to: 'posts#key', via: 'get', id: /[a-f0-9]+/, key: /.*/


=begin
devise_for :users, :controllers => {
  :users => "re"
}

devise_scope :user do
  root to: "users#show" # This is the root path of the user when you are logged in
end

unauthenticated do
  root to: root_url, :as => "unauthenticated"
end
=end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
