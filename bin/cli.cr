require "http/client"
require "optarg"
require "xml"
require "../src/podnapisi"
require "./args_parser"

opts           = Podnapisi::ArgsParser.parse(ARGV)

begin
  show_name      = opts.name
  season_number  = opts.season.to_i
  episode_number = opts.episode.to_i
rescue KeyError
  abort "Usage: -n|--name name -s|--season season_number -e|--episode episode_number -l|--language pl"
end

client  = Podnapisi::Client.new(show_name, season_number, episode_number, opts.language?)
results = client.results

unless results.empty?
  if opts.maximum?
    results = results.first(opts.maximum.to_i)
  end
  results.each_with_index do |res,idx|
    url = res.url
    puts url
    puts "Language: #{res.language}"

    res.releases.each do |release|
      puts "\t#{release}"
    end

    if opts.download?
      show_name = show_name.gsub(/\s+/,"_")
      file_name = "#{show_name}S#{season_number}E#{episode_number}_#{res.language}_sub_#{idx}.zip"
      puts "writing #{file_name}"
      Process.run("sh", ["-c", "wget #{url} -O #{file_name}"])
    end
    puts "=" * 80
  end
else
  puts "No subtitles found for #{show_name} , season: #{season_number}, episode: #{episode_number}"
end
