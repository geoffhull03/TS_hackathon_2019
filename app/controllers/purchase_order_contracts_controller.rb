class PurchaseOrderContractsController < ApplicationController

  def index
    session[:procoreProjectId] ||= '8673'
    session[:procoreCompanyId] ||= '13958'

    if params[:search]
      query = "&filters[origin_id]=" + "#{params[:search]}"
    else query = ""
    end

    list_poc= RestClient.get("#{ENV['BASE_URL']}/vapid/purchase_order_contracts?project_id=#{session[:procoreProjectId]}#{query}",
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}",
    "Procore-Company-ID" => session[:procoreCompanyId]})

    @purchase_order_contracts = JSON.parse(list_poc)
  end

end
