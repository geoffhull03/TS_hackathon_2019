Rails.application.routes.draw do
  get 'work_order_contracts/index'
	root 'login#index'

  get '/callback', to: 'login#callback'
  get '/landing', to: 'login#landing'
  get '/procore', to: 'login#procore'
  get '/work_order_contracts', to: 'work_order_contracts#index'
end
