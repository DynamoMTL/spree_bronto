Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :bronto_lists do
      collection do
         get 'get_lists'
      end
    end
  end

  resources :orders, :except => [:index, :new, :create, :destroy] do
    patch :subscribe, :on => :member
  end

  post "/newsletter_subscribe", :to => 'newsletter#post', as: :newsletter
  post "/subscribecampaign", :to => 'home#subscribecampaign'
  post "/subscribecampaign_with_ops", :to => 'home#subscribecampaign_with_ops'

end

