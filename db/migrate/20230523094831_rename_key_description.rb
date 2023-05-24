class RenameKeyDescription < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :description, :details
  end
end
