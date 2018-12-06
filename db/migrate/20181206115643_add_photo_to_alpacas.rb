class AddPhotoToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :photo, :string
  end
end
