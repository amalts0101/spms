class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.string :hours
      t.string :comments
      t.timestamps
    end
  end
end
