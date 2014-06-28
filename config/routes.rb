WayfarerLive::Application.routes.draw do
  resources :sales

  resources :memberships

  resources :journal_entries
  
  get '/buy', to: 'transactions#new', as: :show_buy
  # get '/buy/:permalink', to: 'transactions#new', as: :show_buy
  post'/buy/:permalink', to:'transactions#create', as: :buy
  get'/pickup/:guid', to:'transactions#pickup', as: :pickup
  get '/download/:guid', to: 'transactions#download', as: :download

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  devise_scope :user do
    get 'users/new_nonks', to: "users/registrations#new_nonks", as: 'new_nonks'
    post 'create_nonks', to: "users/registrations#create_nonks"
  end
  
  
  get "pages/index"
  
  get '/users/:id', :to => 'users#show', :as => :user
  
  match '/journals', to: "journal_entries#index", via: :get
  match '/episodes', to: "pages#episodes", via: :get
  match '/about', to: "pages#about", via: :get
  match '/team', to: "pages#team", via: :get
  match '/get_access', to: "pages#get_access", via: :get
  match '/social_hub', to: "pages#social_hub", via: :get
  match '/header_iframe', to: "pages#header_iframe", via: :get
  match '/sponsors', to: "pages#sponsors", via: :get
  match '/contact_us', to: "pages#contact_us", via: :get
  match '/exclusive_content', to: "pages#exclusive_content", via: :get
  match '/event', to: "pages#event", via: :get
  match '/polls', to: "pages#polls", via: :get
  match '/access_levels', to: "pages#tiers", via: :get
  root to: "pages#index"
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
