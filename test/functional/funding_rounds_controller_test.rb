require 'test_helper'

class FundingRoundsControllerTest < ActionController::TestCase
  setup do
    @funding_round = funding_rounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funding_rounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funding_round" do
    assert_difference('FundingRound.count') do
      post :create, funding_round: @funding_round.attributes
    end

    assert_redirected_to funding_round_path(assigns(:funding_round))
  end

  test "should show funding_round" do
    get :show, id: @funding_round.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funding_round.to_param
    assert_response :success
  end

  test "should update funding_round" do
    put :update, id: @funding_round.to_param, funding_round: @funding_round.attributes
    assert_redirected_to funding_round_path(assigns(:funding_round))
  end

  test "should destroy funding_round" do
    assert_difference('FundingRound.count', -1) do
      delete :destroy, id: @funding_round.to_param
    end

    assert_redirected_to funding_rounds_path
  end
end
