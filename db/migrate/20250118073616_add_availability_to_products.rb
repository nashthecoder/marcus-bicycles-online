class AddAvailabilityToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :availability, :boolean, default: false, null: false
  end
end
