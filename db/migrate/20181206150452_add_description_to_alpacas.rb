class AddDescriptionToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :description, :text
  end
end
