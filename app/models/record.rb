class Record < ApplicationRecord
  enum gender: [:prefer_not_to_say, :male, :female]
  enum age_range: [:"18_24", :"25_29", :"30_34", :"35_39", :"40_44", :"45_49", :"50_plus"]
  enum infection_location: [:lower_ground_floor, :ground_floor, :first_floor, :second_floor, :third_floor]
end
