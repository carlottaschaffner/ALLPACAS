class AddAddressToAlpacas < ActiveRecord::Migration[5.2]
  def change
    add_column :alpacas, :address, :string
  end
end
