module Podnapisi
  class Subtitle
    getter url, releases, season, episode, language
    def initialize(@url : String, @releases : Array(String), @language : String?, @season : Int32?, @episode : Int32?)
    end

    def url
      File.join(@url, "download")
    end
  end
end
