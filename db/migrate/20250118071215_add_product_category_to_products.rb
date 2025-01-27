class AddProductCategoryToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :product_category, :string
  end
end
