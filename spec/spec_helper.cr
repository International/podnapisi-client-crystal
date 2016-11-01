require "spec"
require "../src/podnapisi"
require "mocks/spec"
require "webmock"

DUMMY_FIXTURE_XML = File.join(__DIR__, "fixtures/podnapisi_response.xml")

def stub_url(url : String, method : Symbol, code : Int32, body : String, headers = {} of String => String)
  WebMock.stub(method, url).
    to_return(status: code, body: body, headers: headers)
end

def stub_get(url : String, body : String, status : Int32)
  WebMock.stub(:get, url).
       to_return(status: status, body: body)
end

def stub_dummy_get(body : String, status : Int32)
  stub_get("https://www.podnapisi.net/subtitles/search/old?sK=show&sTS=1&sTE=1&sL=en&sXML=1", body, status)
end

def stub_dummy_get_with_default_fixture
  stub_dummy_get(File.read(DUMMY_FIXTURE_XML), 200)
end

def build_client(path : String?, url : String, response : String?, code : Int32)
  content = if path
    File.read(File.join(__DIR__, path))
  else
    abort "Need a valid response" unless response
    response
  end

  client  = Podnapisi::Client.new("show", 1, 1, "en")
  stub_get(url, content, code)

  client
end

def url
  "https://www.podnapisi.net/subtitles/search/old?sK=show&sTS=1&sTE=1&sL=en&sXML=1"
end
