class AddCoordinatesToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :latitude, :float
    add_column :alpacas, :longitude, :float
  end
end
