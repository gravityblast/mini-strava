require 'uri'
require 'net/http'
require 'json'

module MiniStrava
  class Client
    class AuthorizationError < Exception; end
    class BlankAccessTokenError < Exception; end

    BaseUrl = 'https://www.strava.com/api/v3'

    def initialize access_token
      raise BlankAccessTokenError.new "access_token can't be blank" if access_token.to_s.strip == ''
      @access_token = access_token
    end

    def athlete
      response = get '/athlete'
      parse_response response, Models::Athlete
    end

    # valid options: before, after, page, per_page
    def activities options={}
      response = get '/activities', options
      parse_response response, Models::Activity
    end

    def activity id, options={}
      response = get "/activities/#{id}"
      parse_response response, Models::Activity
    end

    private

    def get path, params={}
      uri = build_uri path, params
      request = Net::HTTP::Get.new uri
      perform_request request, uri
    end

    def perform_request request, uri
      response = Net::HTTP.start uri.hostname, uri.port, use_ssl: true do |http|
        http.request request
      end

      case response.code
      when 401
        raise AuthorizationError.new
      else
        response
      end
    end

    def parse_response response, type
      attributes = JSON.parse response.body
      if attributes.is_a? Array
        attributes.collect { |a| type.build a }
      else
        type.build attributes
      end
    end

    def build_uri path, params={}
      params = params.merge access_token: @access_token
      uri = URI(File.join(BaseUrl, path))
      uri.query = URI.encode_www_form params
      uri
    end
  end
end
