# MiniStrava

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'mini_strava'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mini_strava

## Usage

    > client = MiniStrava::Client.new 'XYZ'
    => #<MiniStrava::Client:0x007fb42924a380 @access_token="XYZ">

    > a = client.athlete
    > a.firstname
    => "Andrea"

    > a.bikes.first.name
    => 'Giant TCR'

    > activities = client.activities
    > activities.first.average_speed
    => 6.347

    > act = client.activity activities[0].id
    > act.name
    => 'Evening ride'
    > act.distance
    => 24727.3

Check the Strava API documentation to know more about the available fields for each resource.

### CLI

An executable called `mini-strava` will be installed with the gem. To use it, set the `STRAVA_ACCESS_TOKEN` env variable:

    export STRAVA_ACCESS_TOKEN="xyz"

and then use the CLI:

    $ mini-strava
    MiniStrava CLI > athlete.firstname
    => "Andrea"
    MiniStrava CLI > activities.first.name
    => "Evening Ride"

## Contributing

1. Fork it ( http://github.com/<my-github-username>/mini_strava/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
