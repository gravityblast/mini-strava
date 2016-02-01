require 'spec_helper'

module MiniStrava
  describe Client do
    subject { Client.new 'test_token' }

    describe '#build_uri' do
      it 'should build uri with params' do
        params = { foo: :bar, baz: :qux }
        uri = subject.send(:build_uri, '/test', params)

        expected = Client::BaseUrl + '/test?foo=bar&baz=qux&access_token=test_token'
        expect(uri.to_s).to eq(expected)
      end
    end

    describe 'parse_response' do
      it 'should parse response and return an athlete model' do
        body = double('body')
        parsed_body = double('parsed_body')
        model_class = double('model_class')
        response = double('response', body: body)

        expect(JSON).to receive(:parse).with(body).and_return(parsed_body)
        expect(model_class).to receive(:build).with(parsed_body)
        subject.send :parse_response, response, model_class
      end
    end

    describe 'perform_request' do
      context 'not found' do
        it 'raises a ResourceNotFound exception' do
          not_found_response = double('response', code: '404')
          allow(Net::HTTP).to receive(:start).and_return not_found_response
          expect{ subject.send(:perform_request, nil, URI('http://localhost')) }.to raise_error(Client::ResourceNotFound)
        end
      end
    end

    describe '#athlete' do
      it 'should retrieve current athlete' do
        body = fixture 'athlete'
        response = double('response', body: body)
        expect(subject).to receive(:get).with('/athlete').and_return(response)

        athlete = subject.athlete
        expect(athlete.class).to eq(Models::Athlete)
        expect(athlete.firstname).to eq('Foo')
      end
    end

    describe '#activity' do
      it 'should retrieve activity' do
        body = fixture 'activity'
        response = double('response', body: body)
        expect(subject).to receive(:get).with('/activities/10').and_return(response)

        activity = subject.activity 10
        expect(activity.class).to eq(Models::Activity)
        expect(activity.name).to eq('Morning Commute')
      end
    end

    describe '#segment' do
      it 'should retrieve segment' do
        body = fixture 'segment'
        response = double('response', body: body)
        expect(subject).to receive(:get).with('/segments/10').and_return(response)

        segment = subject.segment 10
        expect(segment.class).to eq(Models::Segment)
        expect(segment.name).to eq('Up Lower Caledonian Rd')
      end
    end

    context '#activities' do
      it 'should retrieve activities' do
        body = fixture 'activities'
        response = double('response', body: body)
        expect(subject).to receive(:get).with('/activities', {}).and_return(response)

        activities = subject.activities
        expect(activities.class).to eq(Array)
        expect(activities.size).to eq(2)

        expect(activities[0].class).to eq(Models::Activity)
        expect(activities[0].id).to eq(1)
        expect(activities[0].name).to eq('Morning Commute')

        expect(activities[1].class).to eq(Models::Activity)
        expect(activities[1].id).to eq(2)
        expect(activities[1].name).to eq('Morning Commute 2')
      end
    end

    context '401 Not Authorized' do
      it 'should raise a AuthorizationError exception' do
        response = double('response', code: '401')
        expect(Net::HTTP).to receive(:start).and_return(response)
        expect do
          subject.athlete
        end.to raise_error(Client::AuthorizationError)
      end
    end
  end
end
