require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { first_name: "New", last_name: "Student", school_email: "new@student.com", major: "CS", minor: "Math", expected_graduation_date: "2024-05-15" } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should not create student with invalid attributes" do
    assert_no_difference("Student.count") do
      post students_url, params: { student: { first_name: "", last_name: "", school_email: "invalid_email", major: "", expected_graduation_date: "" } }
    end
    assert_response :unprocessable_entity
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { first_name: @student.first_name, last_name: @student.last_name, school_email: @student.school_email, major: @student.major, minor: @student.minor, expected_graduation_date: @student.expected_graduation_date } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end

  test "should handle missing student gracefully" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get student_url(id: "non-existent-id")
    end
  end

  test "should get index in JSON format" do
    get students_url, as: :json
    assert_response :success
    assert_match "application/json", @response.content_type
  end

  test "should search students by name" do
    get students_url, params: { search: "John" }
    assert_response :success
    assert_select "td", "John Doe"
  end
end