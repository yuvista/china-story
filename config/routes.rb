ChinaStory::Application.routes.draw do
  get "eras/index"

  devise_for :users

  root :to => 'home#index'

  match ':controller(/:action(/:id))(.:format)'
end
