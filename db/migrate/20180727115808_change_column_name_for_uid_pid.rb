class ChangeColumnNameForUidPid < ActiveRecord::Migration[5.2]
  def change
  	rename_column :relationships, :p_id, :project_id
  	rename_column :relationships, :u_id, :user_id
  end
end
