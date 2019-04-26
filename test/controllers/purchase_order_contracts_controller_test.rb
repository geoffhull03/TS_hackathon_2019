require 'test_helper'

class PurchaseOrderContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchase_order_contracts_index_url
    assert_response :success
  end

end
