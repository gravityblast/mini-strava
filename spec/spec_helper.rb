require_relative '../lib/mini_strava/model'
require_relative '../lib/mini_strava/models/gear'
require_relative '../lib/mini_strava/models/athlete'
require_relative '../lib/mini_strava/models/activity'
require_relative '../lib/mini_strava/models/segment'
require_relative '../lib/mini_strava/models/segment_effort'
require_relative '../lib/mini_strava/models/map'
require_relative '../lib/mini_strava/client'

require 'json'

def fixture name
  path = File.dirname(__FILE__) + "/fixtures/#{name}.json"
  File.read path
end

def parse_fixture name
  JSON.parse fixture name
end
