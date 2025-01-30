class Avo::Resources::Product < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  self.search = {
    query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  }

  def fields
    field :id, as: :id
    field :name, as: :text, required: true
    field :price, as: :number, required: true
    field :product_type, as: :text
    field :description, as: :trix, always_show: true
    field :product_category, as: :text
    field :image, as: :file

    # Corrected field name for Category
    field :product_category, as: :select, enum: {
      "Bicycles" => "bicycles",
      "Sports Goods" => "sports_goods"
    }, required: true, searchable: true

    # Dropdown for Availability
    field :availability, as: :select, enum: {
      "In Stock" => "in_stock",
      "Out of Stock" => "out_of_stock",
      "Pre-Order" => "pre_order"
    }, required: true, searchable: true
  end
end
