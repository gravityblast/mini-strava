module MiniStrava
  module Models
    class Athlete
      include Model

      model_attr :id
      model_attr :firstname
      model_attr :lastname
      model_attr :resource_state
      model_attr :profile_medium
      model_attr :profile
      model_attr :city
      model_attr :state
      model_attr :country
      model_attr :sex
      model_attr :date_preference
      model_attr :measurement_preference
      model_attr :email
      model_attr :bikes, type: :Gear, default: []
      model_attr :shoes, type: :Gear, default: []
    end
  end
end
