Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'users#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
      get 'the_wall' => 'posts#index'
      get 'posts/:id/edit' => 'posts#edit'
      get 'posts/:id/show' => 'posts#show'

      get 'comments/:id/edit' => 'comments#edit'

      get 'comments/:id/show' => 'comments#show'

      get 'users/:id/show' => 'users#show', as: :user_show
      get 'users/:id/edit' => 'users#edit', as: :user_edit
      get 'likes/:id/show' => 'likes#show'

      post 'users/create' => 'users#create'
      post 'sessions/create' => 'sessions#create'
      post 'posts/create' => 'posts#create'
      post 'comments/create' => 'comments#create'
      post 'likes/create' => 'likes#create'
      post 'posts/:id' => 'posts#update'
      post 'comments/:id' => 'comments#update'
      post 'users/:id' => 'users#update'

      delete 'sessions/:id' => 'sessions#destroy'
      delete 'posts/:id' => 'posts#destroy'
      delete 'comments/:id' => 'comments#destroy'
      delete 'likes/:id' => 'likes#destroy'
      delete 'users/:id'=> 'users#destroy'
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
