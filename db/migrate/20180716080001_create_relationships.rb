class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :p_id
      t.integer :u_id

      t.timestamps
    end
    add_index :relationships, :p_id
		add_index :relationships, :u_id
		add_index :relationships, [:p_id, :u_id], unique: true
  end
end
