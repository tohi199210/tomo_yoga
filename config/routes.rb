Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#top'

  get 'offices/top' => 'offices#top'

  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy ,:update] do
  	resources :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    
  end
  
  resources 'users'

  get 'users/:id/withdrawal' => 'users#withdrawal' , as: 'user_withdrawal'
  patch 'users/:id/withdrawal' => 'users#withdrawal_done', as: 'user_withdrawal_done'
  put "/users/:id/withdrawal" => 'users#withdrawal_done', as: 'users_withdrawal_done'

end
