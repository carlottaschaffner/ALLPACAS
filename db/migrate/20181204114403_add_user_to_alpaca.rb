class AddUserToAlpaca < ActiveRecord::Migration[5.2]
  def change
    add_reference :alpacas, :user, foreign_key: true
  end
end
