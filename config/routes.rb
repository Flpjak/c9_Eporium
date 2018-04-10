Rails.application.routes.draw do
  root :to => 'catalog#index'
  
  match 'catalog/latest', :to => 'catalog#latest', via: [:get, :post]
  
  get 'catalog/index'

  get 'catalog/show'

  get 'catalog/search'

  get 'catalog/latest'

  get 'about/index'
  
  namespace :admin do
    resources :author
    resources :publishers
    resources :books
  end
  
  scope :module => "admin" do
    resources :books
  end

end