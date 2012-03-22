require 'test_helper'

class Ec2InstanceControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

end
