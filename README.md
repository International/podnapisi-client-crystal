# podnapisi-client

Provides some utilities for accessing podnapisi.net's subtitle search API.

## Installation

* Do a git clone
`git clone https://github.com/International/podnapisi-client-crystal`
* Change dir to where you cloned
* Run make:
`make`

## Usage

The cli tool accepts the following parameters:

`Usage: -n|--name name -s|--season season_number -e|--episode episode_number -l|--language language_code`

* `-n` represents the name of the show. Should be quoted if it contains more than one word.
* `-s` represents the season, ex: 1
* `-e` represents the episode number, ex: 1
* `-l` two letter code for a language, ex: en (pl/ru/etc)
* `-d` boolean flag, whether to download all the subtitles or not. If `-d` is not passed,
then the client will display the subtitles found, and for which movie releases they match. If you do pass `-d`, then for each subtitle, it will download them to the current folder, with the following name format: `name`S`season`E`episode`_sub_`subtitle number starting from 0`.zip

## Contributing

1. Fork it ( https://github.com/International/podnapisi-client-crystal/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[International]](https://github.com/International) George Opritescu - creator, maintainer
