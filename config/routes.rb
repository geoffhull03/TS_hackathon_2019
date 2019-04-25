Rails.application.routes.draw do
	root 'login#index'

  get '/callback', to: 'login#callback'
  get '/landing', to: 'login#landing'
  get '/procore', to: 'login#procore'
end
