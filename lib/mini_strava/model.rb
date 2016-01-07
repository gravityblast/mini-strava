module MiniStrava
  module Model
    DefaultAttrType = :basic

    def self.included base
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module InstanceMethods
      def attributes
        @attributes ||= {}
      end
    end

    module ClassMethods
      def build attributes
        object = self.new
        model_attributes.each do |attr|
          object.send "#{attr[:name]}=", attributes[attr[:name]]
        end
        object
      end

      def model_attributes
        @model_attributes ||= []
      end

      def model_attr name, type: DefaultAttrType, default: nil
        model_attributes << {
          name:     name.to_s,
          type:     type,
          default:  default
        }
        define_model_att_reader name
        define_model_att_writer name, type, default
      end

      def define_model_att_reader name
        define_method name do
          attributes[name]
        end
      end

      def define_model_att_writer name, type, default
        define_method "#{name}=" do |value|
          value = default if value.nil?
          if type != DefaultAttrType
            klass = Models.const_get type.to_s
            value = if value.is_a? Array
              value.collect do |v|
                klass.build v || {}
              end
            else
              klass.build value || {}
            end
          end

          attributes[name] = value
        end
      end
    end
  end
end
