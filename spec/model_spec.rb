require 'spec_helper'

module MiniStrava
  module Models
    class TestModelBike
      include MiniStrava::Model

      model_attr :name
    end

    class TestModelAthlete
      include MiniStrava::Model

      model_attr :name, default: "No Name"
      model_attr :bikes, type: :TestModelBike, default: []
    end
  end

  describe Model do
    context 'default types' do
      it 'should set default model attribute types' do
        expect(Models::TestModelBike.model_attributes).to eq([
          {
            name: 'name',
            type: MiniStrava::Model::DefaultAttrType,
            default: nil
          }
        ])
      end

      it 'should parse and use default values' do
        bike = Models::TestModelBike.build({})
        expect(bike.name).to eq(nil)

        athlete = Models::TestModelAthlete.build({})
        expect(athlete.name).to eq('No Name')
      end
    end

    context 'Custom attribute type' do
      it 'should set custom model attributes' do
        expect(Models::TestModelAthlete.model_attributes).to eq([
          {
            name: 'name',
            type: MiniStrava::Model::DefaultAttrType,
            default: 'No Name'
          },
          {
            name: 'bikes',
            type: :TestModelBike,
            default: []
          }
        ])
      end

      it 'should parse custom types' do
        attributes = {
          'name' => 'Foo',
          'bikes' => [
            {
              'name' => 'Bike 1'
            }
          ]
        }
        athlete = Models::TestModelAthlete.build attributes
        expect(athlete.name).to eq('Foo')
        expect(athlete.bikes.class).to eq(Array)
        expect(athlete.bikes[0].name).to eq('Bike 1')
      end
    end

    context 'Default values' do
      it 'should use default values for model attributes' do
        athlete = Models::TestModelAthlete.build({})
        expect(athlete.bikes).to eq([])
      end
    end
  end
end
