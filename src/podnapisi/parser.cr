module Podnapisi
  class Parser
    getter dom, subtitles : Array(Subtitle)

    def initialize(@input : String)
      @dom           = XML.parse_html(@input)
      @subtitles     = [] of Subtitle
      parse
    end

    private def parse
      subtitle_nodes        = dom.xpath_nodes("//subtitle")
      @subtitles            = subtitle_nodes.map do |sub|
        url                 = sub.xpath_node("./url").as(XML::Node).text.as(String)
        releases            = sub.xpath_nodes(".//releases/release").map &.text.as(String).chomp.strip
        language_node       = sub.xpath_node("./languagename")
        language            = language_node && language_node.text.as(String)
        season_node         = sub.xpath_node("./tvseason")
        season              = season_node && season_node.text.as(String).to_i
        episode_node        = sub.xpath_node("./tvepisode")
        episode_number      = episode_node && episode_node.text.as(String).to_i

        Subtitle.new(url, releases, language, season, episode_number)
      end
    end
  end
end
