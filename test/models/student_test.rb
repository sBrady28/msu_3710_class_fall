require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "should raise error when saving student without first name" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(last_name: "Nikola", school_email: "jokic@msudenver.edu", major: "CS", expected_graduation_date: "2024-05-15")
    end
  end

  test "should raise error when saving student without last name" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Nikola", school_email: "jokic@msudenver.edu", major: "CS", expected_graduation_date: "2024-05-15")
    end
  end

  test "should raise error when saving student without school email" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Nikola", last_name: "Jokic", major: "CS", expected_graduation_date: "2024-05-15")
    end
  end

  test "should raise error when saving student without major" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Nikola", last_name: "Jokic", school_email: "jokic@msudenver.edu", expected_graduation_date: "2024-05-15")
    end
  end

  test "should raise error when saving student without expected graduation date" do
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Nikola", last_name: "Jokic", school_email: "jokic@msudenver.edu", major: "CS")
    end
  end

  test "should not allow duplicate school_email" do
    student = students(:one)
    assert_raises ActiveRecord::RecordInvalid do
      Student.create!(first_name: "Run", last_name: "Time", school_email: student.school_email, major: "CSI", expected_graduation_date: "2024-05-15")
    end
  end

  test "should save student with valid attributes" do
    student = Student.create!(first_name: "Ruby", last_name: "Rails", school_email: "rrails@msudenver.edu", major: "CS", expected_graduation_date: "2024-05-15")
    assert student.persisted?, "Student was not persisted"
  end

  test "should save student with minor field" do
    student = Student.create!(first_name: "Ruby", last_name: "Rails", school_email: "rrails@msudenver.edu", major: "CS", minor: "Math", expected_graduation_date: "2024-05-15")
    assert student.persisted?, "Student was not persisted"
  end
end