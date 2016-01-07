require 'spec_helper'

module MiniStrava
  module Models
    describe Athlete do
      describe 'model attributes' do
        it 'should set model attributes' do
          attributes = Athlete.model_attributes
          expect(attributes).to eq([
            {
              name: 'id',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'firstname',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'lastname',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'resource_state',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'profile_medium',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'profile',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'city',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'state',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'country',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'sex',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'date_preference',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'measurement_preference',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'email',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'bikes',
              type: :Gear,
              default: []
            },
            {
              name: 'shoes',
              type: :Gear,
              default: []
            },
          ])
        end
      end

      describe 'build from attributes' do
        subject { Athlete.build parse_fixture('athlete') }

        it 'should set attributes values' do
          expect(subject.id).to eq(1)
          expect(subject.firstname).to eq('Foo')
          expect(subject.lastname).to eq('Bar')
          expect(subject.profile_medium).to eq('http://example.com/medium.jpg')
          expect(subject.profile).to eq('http://example.com/profile.jpg')

          bikes = subject.bikes
          expect(bikes.class).to eq(Array)

          expect(bikes[0].class).to eq(Gear)
          expect(bikes[0].id).to eq('10')
          expect(bikes[0].primary).to eq(false)
          expect(bikes[0].name).to eq('Bike 1')
          expect(bikes[0].resource_state).to eq(2)
          expect(bikes[0].distance).to eq(268552.0)

          expect(bikes[1].class).to eq(Gear)
          expect(bikes[1].id).to eq('20')
          expect(bikes[1].primary).to eq(true)
          expect(bikes[1].name).to eq('Bike 2')
          expect(bikes[1].resource_state).to eq(2)
          expect(bikes[1].distance).to eq(426398.0)
        end
      end
    end
  end
end
