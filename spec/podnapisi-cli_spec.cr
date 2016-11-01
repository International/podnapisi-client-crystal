require "./spec_helper"

def error_message
  "Usage: -n|--name name -s|--season season_number -e|--episode episode_number -l|--language pl"
end

describe "podnapisi cli" do
  it "should not be valid when running with an empty argv" do
    args = [] of String
    expect_raises(Podnapisi::RequiredParamNotSent, error_message) do
      Podnapisi::CLI.new(args).run
    end
  end

  it "should be valid when passing required args" do
    stub_dummy_get_with_default_fixture
    args = ["-n", "show", "-e", "1", "-s", "1", "-l", "en"]
    Podnapisi::CLI.new(args).run
  end
end
