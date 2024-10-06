class CreateExampletable < ActiveRecord::Migration[7.1]
  def change
    create_table :exampletables do |t|

      t.timestamps
    end
  end
end
