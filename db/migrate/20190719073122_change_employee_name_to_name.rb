class ChangeEmployeeNameToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :emp_name, :name
  end
end
