module MiniStrava
  module Models
    class SegmentEffort
      include Model

      model_attr :id
      model_attr :resource_state
      model_attr :name
      model_attr :activity, type: :Activity
      model_attr :athlete, type: :Athlete
      model_attr :elapsed_time
      model_attr :moving_time
      model_attr :start_date
      model_attr :start_date_local
      model_attr :distance
      model_attr :segment, type: :Segment
    end
  end
end

