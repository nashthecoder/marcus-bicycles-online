class Product < ApplicationRecord
  has_one_attached :image

  # def product_type_suggestions
  #   %w[
  #   Frame Wheels

  #   Tires

  #     Shifters
  #     Crankset
  #     Bottom Bracket
  #     Derailleurs
  #     Cassette
  #     Chain
  #     Brakes
  #     Rotors
  #     Cables
  #     Housing
  #     Seatpost
  #     Saddle
  #     Handlebars
  #     Grips/Tape
  #     Stem
  #     Headset
  #     Pedals
  #     ]
  # end
end
