class PurchaseOrderContractsController < ApplicationController
	before_action :logged_in

  def index
  	# Unless loops to prevent debug code from triggering in prod
  	unless session[:procoreProjectId]
    	session[:procoreProjectId] = '8673'
    end
    unless session[:procoreCompanyId]
    	session[:procoreCompanyId] = '13958'
    end

    list_poc= RestClient.get(ENV['BASE_URL'] + '/vapid/purchase_order_contracts?project_id=' + session[:procoreProjectId],
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}",
    "Procore-Company-ID" => session[:procoreCompanyId]})

    @purchase_order_contracts = JSON.parse(list_poc)
  end

end
