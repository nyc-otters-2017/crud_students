class Books < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :user

      t.timestamps

    end
  end
end
