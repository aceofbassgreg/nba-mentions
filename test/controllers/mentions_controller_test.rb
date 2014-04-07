require 'test_helper'

class MentionsControllerTest < ActionController::TestCase
  setup do
    @mention = mentions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mentions)
  end

  test "should create mention" do
    assert_difference('Mention.count') do
      post :create, mention: { article_id: @mention.article_id, team_id: @mention.team_id }
    end

    assert_response 201
  end

  test "should show mention" do
    get :show, id: @mention
    assert_response :success
  end

  test "should update mention" do
    put :update, id: @mention, mention: { article_id: @mention.article_id, team_id: @mention.team_id }
    assert_response 204
  end

  test "should destroy mention" do
    assert_difference('Mention.count', -1) do
      delete :destroy, id: @mention
    end

    assert_response 204
  end
end
