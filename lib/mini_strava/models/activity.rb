module MiniStrava
  module Models
    class Activity
      include Model

      model_attr :id
      model_attr :resource_state
      model_attr :external_id
      model_attr :athlete, type: :Athlete
      model_attr :name
      model_attr :distance
      model_attr :moving_time
      model_attr :elapsed_time
      model_attr :total_elevation_gain
      model_attr :type
      model_attr :start_date
      model_attr :start_date_local
      model_attr :timezone
      model_attr :start_latlng
      model_attr :end_latlng
      model_attr :location_city
      model_attr :location_state
      model_attr :location_country
      model_attr :start_latitude
      model_attr :start_longitude
      model_attr :average_speed
      model_attr :max_speed
      model_attr :segment_efforts, type: :SegmentEffort, default: []
    end
  end
end
