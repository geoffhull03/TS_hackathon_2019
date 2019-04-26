class PurchaseOrderContractsController < ApplicationController
	before_action :logged_in

  def index
    session[:procoreProjectId] = '8673'
    session[:procoreCompanyId] = '13958'

    list_poc= RestClient.get(ENV['BASE_URL'] + '/vapid/purchase_order_contracts?project_id=' + session[:procoreProjectId],
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}",
    "Procore-Company-ID" => session[:procoreCompanyId]})

    @purchase_order_contracts = JSON.parse(list_poc)
    puts @purchase_order_contracts
  end

end
