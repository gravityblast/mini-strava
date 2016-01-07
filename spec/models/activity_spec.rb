require 'spec_helper'

module MiniStrava
  module Models
    describe Activity do
      describe 'model attributes' do
        it 'should set model attributes' do
          expected = [
            {
              name: 'athlete',
              type: :Athlete,
              default: nil
            },
            {
              name: 'segment_efforts',
              type: :SegmentEffort,
              default: []
            },
          ]

          [:id, :resource_state, :external_id,
          :name, :distance, :moving_time,
          :elapsed_time, :total_elevation_gain,
          :type, :start_date, :start_date_local,
          :timezone, :start_latlng, :end_latlng,
          :location_city, :location_state, :location_country,
          :start_latitude, :start_longitude, :average_speed, :max_speed].each do |attr|
            expected << {
              name: attr.to_s,
              type: Model::DefaultAttrType,
              default: nil
            }
          end

          expect(Activity.model_attributes).to match_array(expected)
        end
      end

      describe 'build from attributes' do
        subject { Activity.build parse_fixture('activity') }

        it 'should set attributes values' do
          expect(subject.athlete.id).to eq(101)
          expect(subject.athlete.resource_state).to eq(1)
          expect(subject.id).to eq(12)
          expect(subject.resource_state).to eq(3)
          expect(subject.external_id).to eq('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa')
          expect(subject.name).to eq('Morning Commute')
          expect(subject.distance).to eq(1850.6)
          expect(subject.moving_time).to eq(443)
          expect(subject.elapsed_time).to eq(443)
          expect(subject.total_elevation_gain).to eq(12.6)
          expect(subject.type).to eq('Ride')
          expect(subject.start_date).to eq('2014-08-08T09:14:08Z')
          expect(subject.start_date_local).to eq('2014-08-08T10:14:08Z')
          expect(subject.timezone).to eq('(GMT+00:00) Europe/London')
          expect(subject.start_latlng).to eq([50.0, -1])
          expect(subject.end_latlng).to eq([52.0, -2])
          expect(subject.location_city).to eq('London')
          expect(subject.location_state).to eq('England')
          expect(subject.location_country).to eq('United Kingdom')
          expect(subject.start_latitude).to eq(50.0)
          expect(subject.start_longitude).to eq(-1)
          expect(subject.average_speed).to eq(4.177)
          expect(subject.max_speed).to eq(13.6)

          expect(subject.segment_efforts.class).to eq(Array)
          expect(subject.segment_efforts.size).to eq(1)
          expect(subject.segment_efforts[0].id).to eq(3333)
        end
      end
    end
  end
end
