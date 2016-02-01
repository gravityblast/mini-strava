module MiniStrava
  module Models
    class Segment
      include Model

      model_attr :id
      model_attr :resource_state
      model_attr :name
      model_attr :activity_type
      model_attr :distance
      model_attr :average_grade
      model_attr :maximum_grade
      model_attr :elevation_high
      model_attr :elevation_low
      model_attr :city
      model_attr :state
      model_attr :country
      model_attr :map, type: :Map
    end
  end
end
