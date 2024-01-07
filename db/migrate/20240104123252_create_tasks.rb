class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|

      t.references :project, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :deadline
      t.boolean :done, default: false
      t.integer :priority, default: 0
      t.integer :advancement, default: 0

      t.timestamps
    end
  end
end
