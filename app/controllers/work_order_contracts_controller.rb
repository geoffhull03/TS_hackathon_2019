class WorkOrderContractsController < ApplicationController
	before_action :logged_in

  def index
    # Debug values in unless to avoid trigger in Prod
    unless session[:procoreProjectId]
      session[:procoreProjectId] = '8673'
    end
    unless session[:procoreCompanyId]
      session[:procoreCompanyId] = '13958'
    end

    list_woc= RestClient.get("#{ENV['BASE_URL']}/vapid/work_order_contracts?project_id=#{session[:procoreProjectId]}",
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}",
    "Procore-Company-ID" => session[:procoreCompanyId]})

    @work_order_contracts = JSON.parse(list_woc)
  end
end
