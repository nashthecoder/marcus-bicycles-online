class Avo::Resources::Coupon < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :code, as: :text
    field :discount, as: :number
    field :active, as: :boolean
  end
end
