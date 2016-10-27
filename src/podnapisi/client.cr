module Podnapisi
  class Client
    getter :show_name, :season, :episode, :language
    def initialize(@show_name : String, @season : Int32, @episode : Int32, @language : String)
    end

    private def build_url
      "https://www.podnapisi.net/subtitles/search/old?sK=#{show_name}&sTS=#{season}&sTE=#{episode}&sXML=1&sL=#{language}"
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
