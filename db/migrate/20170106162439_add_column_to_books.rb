class AddColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :student_id, :integer
  end
end
