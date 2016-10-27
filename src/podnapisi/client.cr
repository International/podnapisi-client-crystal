module Podnapisi
  class Client
    getter :show_name, :season, :episode, :language
    def initialize(@show_name : String, @season : Int32, @episode : Int32, @language : String?)
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
      response = HTTP::Client.get(build_url)
      if response.status_code == 200
        Parser.new(response.body).subtitles
      else
        [] of Subtitle
      end
    end
  end
end
