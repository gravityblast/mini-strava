module MiniStrava
  module Models
    class Map
      include Model

      model_attr :id
      model_attr :polyline
      model_attr :resource_state
    end
  end
end

