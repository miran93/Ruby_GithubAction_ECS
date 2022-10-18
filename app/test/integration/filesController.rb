require 'test_helper'

class FilesControllerTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "api/v1/files"
    assert_select "status", "SUCCESS"
  end
end
