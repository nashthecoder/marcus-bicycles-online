class Avo::Resources::Product < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  self.search = {
     query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :price, as: :number
    field :image, as: :file
  end
end
