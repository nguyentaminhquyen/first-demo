require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get task_list" do
    get tasks_task_list_url
    assert_response :success
  end

  test "should get new" do
    get tasks_new_url
    assert_response :success
  end

  test "should get create" do
    get tasks_create_url
    assert_response :success
  end

  test "should get update" do
    get tasks_update_url
    assert_response :success
  end

  test "should get delete" do
    get tasks_delete_url
    assert_response :success
  end

end
