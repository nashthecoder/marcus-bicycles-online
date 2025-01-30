class RenameProductCatergoryToProductCategory < ActiveRecord::Migration[8.0]
  def change
    rename_column :products, :product_catergory, :product_category
  end
end
