class AddExpectedGraduationDateToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :expected_graduation_date, :date
  end
end
