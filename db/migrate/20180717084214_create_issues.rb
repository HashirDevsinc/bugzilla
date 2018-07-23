class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :deadline
      t.string :type
      t.string :status
      t.string :img
      t.integer :d_id
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
