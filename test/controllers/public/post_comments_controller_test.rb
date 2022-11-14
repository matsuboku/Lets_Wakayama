require "test_helper"

class Public::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get public_post_comments_new,_url
    assert_response :success
  end

  test "should get index," do
    get public_post_comments_index,_url
    assert_response :success
  end

  test "should get show" do
    get public_post_comments_show_url
    assert_response :success
  end
end
