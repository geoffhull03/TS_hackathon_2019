require 'test_helper'

class WorkOrderContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get work_order_contracts_index_url
    assert_response :success
  end

end
