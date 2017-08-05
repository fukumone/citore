# == Schema Information
#
# Table name: food_forecast_user_restaurant_outputs
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  user_location_id   :integer
#  information_type   :string(255)      not null
#  latitude           :float(24)        default(0.0), not null
#  longitude          :float(24)        default(0.0), not null
#  address            :string(255)
#  phone_number       :string(255)
#  place_id           :string(255)      not null
#  place_name         :string(255)      not null
#  place_name_reading :string(255)      not null
#  place_description  :text(65535)      not null
#  url                :string(255)      not null
#  image_url          :string(255)
#  coupon_url         :string(255)
#  recommended_at     :datetime         not null
#  is_select          :boolean          default(FALSE), not null
#  opentime           :string(255)      default(""), not null
#  holiday            :string(255)      default(""), not null
#  page_number        :integer          not null
#  options            :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  restaurant_outputs_lat_lon_index         (latitude,longitude)
#  restaurant_outputs_location_id_index     (user_location_id)
#  restaurant_outputs_place_id_index        (place_id)
#  restaurant_outputs_recommended_at_index  (recommended_at)
#  restaurant_outputs_user_id_index         (user_id)
#

require 'test_helper'

class FoodForecast::UserRestaurantOutputTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
