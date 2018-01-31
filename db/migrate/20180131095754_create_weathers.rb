class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.date :day
      t.text :data

      t.timestamps
    end
  end
end
