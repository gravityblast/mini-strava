module MiniStrava
  module Models
    class Gear
      include Model

      model_attr :id
      model_attr :primary
      model_attr :name
      model_attr :resource_state
      model_attr :distance
      model_attr :brand_name
      model_attr :model_name
      model_attr :frame_type
      model_attr :description
    end
  end
end
