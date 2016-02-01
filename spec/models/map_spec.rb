require 'spec_helper'

module MiniStrava
  module Models
    describe Map do
      describe 'model attributes' do
        it 'should set model attributes' do
          expected = [
            :id, :polyline, :resource_state,
          ].collect do |attr|
            {
              name: attr.to_s,
              type: Model::DefaultAttrType,
              default: nil
            }
          end

          expect(Map.model_attributes).to match_array(expected)
        end
      end

      describe 'build from attributes' do
        subject { Map.build parse_fixture('map') }

        it 'should set attributes values' do
          expect(subject.id).to eq("s123456")
          expect(subject.polyline).to eq('foobarbaz')
          expect(subject.resource_state).to eq(3)
        end
      end
    end
  end
end


