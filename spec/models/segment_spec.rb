require 'spec_helper'

module MiniStrava
  module Models
    describe Segment do
      describe 'model attributes' do
        it 'should set model attributes' do
          expected = [
            {
              name: 'map',
              type: :Map,
              default: nil
            }
          ]

          [
            :id, :resource_state, :name,
            :activity_type, :distance, :average_grade,
            :maximum_grade, :elevation_high, :elevation_low,
            :city, :state, :country, :start_latlng, :end_latlng
          ].each do |attr|
            expected << {
              name: attr.to_s,
              type: Model::DefaultAttrType,
              default: nil
            }
          end

          expect(Segment.model_attributes).to match_array(expected)
        end
      end

      describe 'build from attributes' do
        subject { Segment.build parse_fixture('segment') }

        it 'should set attributes values' do
          expect(subject.id).to eq(1364097)
          expect(subject.resource_state).to eq(3)
          expect(subject.name).to eq('Up Lower Caledonian Rd')
          expect(subject.activity_type).to eq('Ride')
          expect(subject.distance).to eq(1144.2)
          expect(subject.average_grade).to eq(1.2)
          expect(subject.maximum_grade).to eq(3.2)
          expect(subject.elevation_high).to eq(37.0)
          expect(subject.elevation_low).to eq(23.5)
          expect(subject.city).to eq('London')
          expect(subject.state).to eq('Greater London')
          expect(subject.country).to eq('United Kingdom')
          expect(subject.start_latlng).to eq([51.53377859853208, -0.11831676587462425])
          expect(subject.end_latlng).to eq([51.54375683516264, -0.11777026578783989])
        end
      end
    end
  end
end

