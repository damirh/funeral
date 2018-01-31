class CreateFunerals < ActiveRecord::Migration[5.1]
  def change
    create_table :funerals do |t|
      t.integer :user_id
      t.datetime :start_time

      t.timestamps
    end
  end
end
