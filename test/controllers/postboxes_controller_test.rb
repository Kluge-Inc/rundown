require 'test_helper'

class PostboxesControllerTest < ActionController::TestCase
  setup do
    @postbox = postboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postbox" do
    assert_difference('Postbox.count') do
      post :create, postbox: { email: @postbox.email, periodity: @postbox.periodity }
    end

    assert_redirected_to postbox_path(assigns(:postbox))
  end

  test "should show postbox" do
    get :show, id: @postbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postbox
    assert_response :success
  end

  test "should update postbox" do
    patch :update, id: @postbox, postbox: { email: @postbox.email, periodity: @postbox.periodity }
    assert_redirected_to postbox_path(assigns(:postbox))
  end

  test "should destroy postbox" do
    assert_difference('Postbox.count', -1) do
      delete :destroy, id: @postbox
    end

    assert_redirected_to postboxes_path
  end
end
