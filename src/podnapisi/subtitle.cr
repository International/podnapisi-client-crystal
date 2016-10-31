module Podnapisi
  class Subtitle
    getter url, releases, season, episode, language
    def initialize(@url : String, @releases : Array(String), @language : String?, @season : Int32?, @episode : Int32?)
    end

    def url
      File.join(@url, "download")
    end

    def ==(other)
      [url, releases, season, episode, language] == [other.url, other.releases, other.season, other.episode, other.language]
    end
  end
end
