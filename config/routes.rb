Rails.application.routes.draw do
  # https://stackoverflow.com/questions/6567863/no-route-matches-get-users-sign-out  
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  
#  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
