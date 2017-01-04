class Students < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null:  false
      t.boolean :ontime, default: true

      t.timestamps
    end
  end
end
