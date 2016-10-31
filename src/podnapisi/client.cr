require "cossack"

module Podnapisi
  class Client
    getter :show_name, :season, :episode, :language
    property :http_client

    def initialize(@show_name : String, @season : Int32, @episode : Int32, @language : String?)
      @http_client = Cossack::Client.new do |client|
        client.use Cossack::RedirectionMiddleware, limit: 10
      end
    end

    private def build_url
      params       = {
        "sK"   => show_name, "sTS" => season,
        "sTE"  => episode,   "sL"  => language,
        "sXML" => 1
      }
      query_params = params.select{|k,v| v}.map{|k,v| "#{k}=#{v}"}.join("&")
      "https://www.podnapisi.net/subtitles/search/old?#{query_params}"
    end

    def results
      response = http_client.get(build_url)
      if response.status == 200
        Parser.new(response.body).subtitles
      else
        [] of Subtitle
      end
    end
  end
end
