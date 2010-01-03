ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :flights
  map.resources :planes
  map.resources :people

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  
  map.flightlist 'flightlist/:date.:format', :controller => 'flightlist', :action => 'show', :requirements => { :date => /(today|yesterday|\d\d\d\d-\d\d-\d\d)/ }
  map.plane_log  'plane_log/:date.:format' , :controller => 'plane_log' , :action => 'show', :requirements => { :date => /(today|yesterday|\d\d\d\d-\d\d-\d\d)/ }
  map.pilot_log  'pilot_log/:date.:format' , :controller => 'pilot_log' , :action => 'show', :requirements => { :date => /(today|yesterday|\d\d\d\d-\d\d-\d\d)/ } # TODO or range
  map.flight_db  'flight_db/:date.:format' , :controller => 'flight_db' , :action => 'show', :requirements => { :date => /(today|yesterday|\d\d\d\d-\d\d-\d\d)/ } # TODO or range
  
  map.root :controller => 'home'

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:id/:action'
  map.connect ':controller/:action'
  map.connect ':controller', :action => 'index'

  map.login  'login',  :controller => 'session', :action => 'login'
  map.logout 'logout', :controller => 'session', :action => 'logout'
  
  #map.index 'index', :controller => "pages", :action => "main"
  #map.root :index 
end

