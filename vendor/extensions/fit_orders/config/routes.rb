Refinery::Core::Engine.routes.draw do
  
  # Frontend routes
  namespace :fit_orders do
    resources :fit_orders, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :fit_orders, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :fit_orders, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
