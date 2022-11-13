require "test_helper"

class Public::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new," do
    get public_posts_new,_url
    assert_response :success
  end

  test "should get index," do
    get public_posts_index,_url
    assert_response :success
  end

  test "should get show" do
    get public_posts_show_url
    assert_response :success
  end
end
