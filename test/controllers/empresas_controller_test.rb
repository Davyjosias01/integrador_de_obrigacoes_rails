require "test_helper"

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get empresas_index_url
    assert_response :success
  end

  test "should get integrar" do
    get empresas_integrar_url
    assert_response :success
  end
end
