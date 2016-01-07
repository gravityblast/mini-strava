require 'spec_helper'

module MiniStrava
  module Models
    describe Gear do
      describe 'model attributes' do
        it 'should set model attributes' do
          attributes = Gear.model_attributes
          expect(attributes).to eq([
            {
              name: 'id',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'primary',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'name',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'resource_state',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'distance',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'brand_name',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'model_name',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'frame_type',
              type: Model::DefaultAttrType,
              default: nil
            },
            {
              name: 'description',
              type: Model::DefaultAttrType,
              default: nil
            }
          ])
        end
      end

      describe 'build from attributes' do
        subject { Gear.build parse_fixture('gear') }

        it 'should set attributes values' do
          expect(subject.id).to eq('a1')
          expect(subject.primary).to eq(true)
          expect(subject.resource_state).to eq(3)
          expect(subject.distance).to eq(428313.0)
          expect(subject.brand_name).to eq('Giant')
          expect(subject.model_name).to eq('TCR 1 Compact')
          expect(subject.frame_type).to eq(3)
          expect(subject.description).to eq('hello world')
        end
      end
    end
  end
end
