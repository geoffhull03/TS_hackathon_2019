class WorkOrderContractsController < ApplicationController

  def index
    session[:procoreProjectId] = '8673'
    session[:procoreCompanyId] = '13958'

    list_woc= RestClient.get(ENV['BASE_URL'] + '/vapid/work_order_contracts?project_id=' + session[:procoreProjectId],
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}",
    "Procore-Company-ID" => session[:procoreCompanyId]})

    @work_order_contracts = JSON.parse(list_woc)
    puts @work_order_contracts
  end
end
