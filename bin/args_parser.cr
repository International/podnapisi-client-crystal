module Podnapisi
  class ArgsParser < Optarg::Model
    string %w(--name -n)
    string %w(--season -s)
    string %w(--episode -e)
    string %w(--language -l), required: false
    bool %w(--download -d)
  end
end
