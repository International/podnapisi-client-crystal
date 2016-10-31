require "./spec_helper"
require "optarg"
require "../bin/args_parser"

describe "podnapisi parser" do
  it "should correctly parse subtitles" do
    content = File.read(File.join(__DIR__, "./fixtures/podnapisi_response.xml"))
    parser = Podnapisi::Parser.new(content)
    subtitles = parser.subtitles

    expected = [
      Podnapisi::Subtitle.new(
        "http://www.podnapisi.net/subtitles/en-arrow-2012-S01E01/KMA_",
        ["Arrow.S01E01.BDRip.X264-DEMAND", "Arrow.S01.BDRip.X264-DEMAND"],
        "English", 1, 1
      ),
      Podnapisi::Subtitle.new(
        "http://www.podnapisi.net/subtitles/en-arrow-2012-S01E01/TKE8",
        ["The Vampire Diaries S01E01 720p BluRay DD5.1 x264-CtrlHD"],
        "English", 1, 1
      ),
      Podnapisi::Subtitle.new(
        "http://www.podnapisi.net/subtitles/en-arrow-2012-S01E01/sd4o",
        ["Arrow.S01E01.BDRip.X264-DEMAND", "Arrow.S01E01.720p.BluRay.x264-DEMAND", "Arrow.S01E01.1080p.BluRay.x264-ROVERS"],
        "English",1, 1
      ),
      Podnapisi::Subtitle.new(
        "http://www.podnapisi.net/subtitles/en-arrow-2012-S01E01/YVYe",
        ["Arrow.S01E01.HDTV.x264-LOL", "Arrow.S01E01.720p.HDTV.X264-DIMENSION"],
        "English", 1, 1
      ),
      Podnapisi::Subtitle.new(
        "http://www.podnapisi.net/subtitles/en-arrow-2012-S01E01/YFYe",
        ["Arrow.S01E01.HDTV.x264-LOL", "Arrow.S01E01.720p.HDTV.X264-DIMENSION", "Arrow.S01E01.720p.WEB-DL.DD5.1.H.264-TB"],
        "English", 1, 1
      )
    ]

    subtitles.size.should eq 5
    subtitles.should eq expected
  end
end
