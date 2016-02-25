# Musikki

This is a full implementation of the Musikki API for Elixir.

**Musikki is a living music platform that aims to bring together all the World's musical knowledge, content and services. Find everything about the 
	artist, album or song; buy and listen; follow artists and get notified of upcoming releases and shows.**

## Installation

  1. Add musikki to your list of dependencies in mix.exs:

        def deps do
          [{:musikki, "~> 0.8"}]
        end

  2. Ensure musikki is started before your application:

        def application do
          [applications: [:musikki]]
        end

## Usage
<pre><code>iex(1)> Musikki.Artists.search [{"artist-name", "Porcupine+Tree"}]
{:ok,
 %HTTPoison.Response{body: "{\"summary\":{\"page\":1,\"limit\":10,\"total_pages\":1,\"result_count\":1,\"errors\":[]},\"results\":[{\"mkid\":100020143,\"foreign_ids\":[{\"id\":\"169c4c28-858e-497b-81a4-8bc15e0026ea\",\"service\":\"musicbrainz\"}],\"type\":\"group\",\"alias_references\":[{\"name\":\"Porcupine Tree\",\"type\":\"other\"}],\"name\":\"Porcupine Tree\",\"image\":\"http://images.musikki.com/artists/mbid/169c4c28-858e-497b-81a4-8bc15e0026ea\",\"location\":{\"start\":null,\"end\":null,\"current\":{\"street\":null,\"city\":null,\"state\":null,\"zip_code\":null,\"country\":{\"name\":\"United Kingdom\",\"code\":\"GB\"},\"geolocation\":{\"lat\":null,\"lng\":null},\"description\":null}},\"dates\":{\"start\":{\"year\":1987,\"month\":null,\"day\":null,\"timestamp\":null},\"end\":null},\"current_labels\":[{\"mkid\":100000036,\"name\":\"Roadrunner Records\",\"country\":null}],\"genres\":[]}]}",
  headers: [{"Server", "nginx"}, {"Date", "Thu, 25 Feb 2016 21:05:49 GMT"},
   {"Content-Type", "application/json"}, {"Content-Length", "768"},
   {"Connection", "keep-alive"},
   {"Access-Control-Allow-Headers",
    "Origin,X-Requested-With,Content-Type,Accept,Authorization,token,appid,appkey,api-version,device-id,device-os,device-model,app-version,country-code,language-code"},
   {"Access-Control-Allow-Methods", "POST,GET,OPTIONS,PUT,DELETE"},
   {"Access-Control-Allow-Origin", "*"},
   {"Strict-Transport-Security",
    "max-age=63072000; includeSubdomains; preload"}], status_code: 200}}</code></pre>

And decode with Poison.

Query parameters must be passed as list of tuples. Example:

<pre><code>Musikki.Editions.songs [{"artist-name", "Porcupine+Tree"}, {"song-title", "Lightbulb+Sun"}]</code></pre>

# Powered by Musikki 