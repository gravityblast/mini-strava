require 'spec_helper'

module MiniStrava
  module Models
    describe SegmentEffort do
      describe 'model attributes' do
        it 'should set model attributes' do
          expected = [
            {
              name: 'activity',
              type: :Activity,
              default: nil
            },
            {
              name: 'athlete',
              type: :Athlete,
              default: nil
            },
            {
              name: 'segment',
              type: :Segment,
              default: nil
            }
          ]

          [
            :id, :resource_state, :name,
            :elapsed_time, :moving_time, :start_date,
            :start_date_local, :distance
          ].each do |attr|
            expected << {
              name: attr.to_s,
              type: Model::DefaultAttrType,
              default: nil
            }
          end

          expect(SegmentEffort.model_attributes).to match_array(expected)
        end
      end

      describe 'build from attributes' do
        subject { SegmentEffort.build parse_fixture('segment_effort') }

        it 'should set attributes values' do
          expect(subject.id).to eq(33)
          expect(subject.resource_state).to eq(3)
          expect(subject.name).to eq('REGENTS PARK LOOP')
          expect(subject.elapsed_time).to eq(656)
          expect(subject.moving_time).to eq(656)
          expect(subject.start_date).to eq('2014-08-11T17:48:40Z')
          expect(subject.start_date_local).to eq('2014-08-11T18:48:40Z')
          expect(subject.distance).to eq(4430.1)

          expect(subject.activity.class).to eq(Activity)
          expect(subject.activity.id).to eq(44)

          expect(subject.athlete.class).to eq(Athlete)
          expect(subject.athlete.id).to eq(55)

          expect(subject.segment.class).to eq(Segment)
          expect(subject.segment.id).to eq(6694602)
        end
      end
    end
  end
end
