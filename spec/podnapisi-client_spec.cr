require "./spec_helper"

describe "podnapisi client" do
  it "should correctly parse subtitles" do
    content = File.read(File.join(__DIR__, "./fixtures/podnapisi_response.xml"))
    client  = Podnapisi::Client.new("show", 1, 1, "en")
    connection = Cossack::TestConnection.new
    connection.stub_get("https://www.podnapisi.net/subtitles/search/old?sK=show&sTS=1&sTE=1&sL=en&sXML=1", {200, content})
    client.http_client.connection = connection
    subtitles = client.results
    subtitles.size.should eq 5
  end

  it "should return an empty array if error code is not 200" do
    client  = Podnapisi::Client.new("show", 1, 1, "en")
    connection = Cossack::TestConnection.new
    connection.stub_get("https://www.podnapisi.net/subtitles/search/old?sK=show&sTS=1&sTE=1&sL=en&sXML=1", {404, ""})
    client.http_client.connection = connection
    subtitles = client.results
    subtitles.size.should eq 0
  end
end
