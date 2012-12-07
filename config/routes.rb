ChinaStory::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  match ':controller(/:action(/:id))(.:format)'
end
