Rails.application.routes.draw do
  get 'login/index'

  get 'login/callback'

  root 'login#index'
  
end
