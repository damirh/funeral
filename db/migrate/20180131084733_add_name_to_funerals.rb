class AddNameToFunerals < ActiveRecord::Migration[5.1]
  def change
    add_column :funerals, :name, :string
  end
end
