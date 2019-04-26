class WorkOrderContractsController < ApplicationController
	before_action :logged_in

  def index
    session[:procoreProjectId] ||= '8673'
    session[:procoreCompanyId] ||= '13958'

      if params[:search]
        query = "&filters[origin_id]=#{params[:search]}"
      else 
      	query = ""
      end

    list_woc= RestClient.get("#{ENV['BASE_URL']}/vapid/work_order_contracts?project_id=#{session[:procoreProjectId]}#{query}",
    {"Authorization" => "Bearer #{session[:oauth_response]['access_token']}",
    "Procore-Company-ID" => session[:procoreCompanyId]})


    @work_order_contracts = JSON.parse(list_woc)
  end

end
