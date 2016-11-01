require "./spec_helper"

Spec.before_each do
  WebMock.reset
end

describe "podnapisi client" do

  it "should correctly parse subtitles" do
    client = build_client("./fixtures/podnapisi_response.xml", url, nil, 200)
    subtitles = client.results
    subtitles.size.should eq 5
  end

  it "should return an empty array if error code is not 200" do
    client = build_client(nil, url, "", 404)
    subtitles = client.results
    subtitles.size.should eq 0
  end

end
