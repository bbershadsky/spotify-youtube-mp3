# Spotify or YouTube URL to MP3 + Batched

Not a fan of the bloated Spotify client loaded with DRM?

Any time someone sends me a Spotify URL instead of logging in with my credentials all I want to do is extract the name of the song/artist to plug into yt-dlp.

**No logins, subscriptions, or API keys needed!**

https://github.com/bbershadsky/spotify-youtube-mp3/assets/7572432/70f1d4bb-41c3-4b04-97d8-3dde584cbda6

### Installation

Install the npm package to scrape spotify URLs

```bash
npm i spotify-url-info
```

Install [yt-dlp](https://github.com/yt-dlp/yt-dlp) and ffmpeg to download and convert the video

```bash
# If you're on OSX
brew install yt-dlp ffmpeg
# If you're on Linux
sudo apt install yt-dlp ffmpeg -y
```

## Usage

1. To download single URL (from spotify or youtube)

```bash
./single.sh "<url>" # Note the double quotes are needed on OSX
```

OUTPUT:

```md
./single.sh "https://www.youtube.com/watch?v=ZXI_M11ZeYQ"
[youtube] Extracting URL: https://www.youtube.com/watch?v=ZXI_M11ZeYQ
[youtube] ZXI_M11ZeYQ: Downloading webpage
[youtube] ZXI_M11ZeYQ: Downloading ios player API JSON
[youtube] ZXI_M11ZeYQ: Downloading android player API JSON
[youtube] ZXI_M11ZeYQ: Downloading m3u8 information
[info] ZXI_M11ZeYQ: Downloading 1 format(s): 251
[download] Destination: Big Bad Wolf [ZXI_M11ZeYQ].webm
[download] 100% of 3.23MiB in 00:00:00 at 4.31MiB/s
[ExtractAudio] Destination: Big Bad Wolf [ZXI_M11ZeYQ].mp3
Deleting original file Big Bad Wolf [ZXI_M11ZeYQ].webm (pass -k to keep)
```

You may need to do `chmod +x ./single.sh` to make it executable.

2. If you have a search query for a Youtube video and just want to grab and process the first result, you can just do it through yt-dlp:

```bash
yt-dlp -x --audio-format mp3 "ytsearch1:YOUR_SEARCH_QUERY"
```

RESULT:

```bash
$ yt-dlp -x --audio-format mp3 "ytsearch1:sun and moon above and beyond club mix"
[youtube:search] Extracting URL: ytsearch1:sun and moon above and beyond club mix
[download] Downloading playlist: sun and moon above and beyond club mix
[youtube:search] query "sun and moon above and beyond club mix": Downloading web client config
[youtube:search] query "sun and moon above and beyond club mix" page 1: Downloading API JSON
[youtube:search] Playlist sun and moon above and beyond club mix: Downloading 1 items of 1
[download] Downloading item 1 of 1
[youtube] Extracting URL: https://www.youtube.com/watch?v=BsrNZU8NdRw
[youtube] BsrNZU8NdRw: Downloading webpage
[youtube] BsrNZU8NdRw: Downloading ios player API JSON
[youtube] BsrNZU8NdRw: Downloading android player API JSON
[youtube] BsrNZU8NdRw: Downloading m3u8 information
[info] BsrNZU8NdRw: Downloading 1 format(s): 251
[download] Destination: Sun & Moon (Above & Beyond Extended Club Mix) [BsrNZU8NdRw].webm
[download] 100% of    7.30MiB in 00:00:01 at 4.88MiB/s
[ExtractAudio] Destination: Sun & Moon (Above & Beyond Extended Club Mix) [BsrNZU8NdRw].mp3
Deleting original file Sun & Moon (Above & Beyond Extended Club Mix) [BsrNZU8NdRw].webm (pass -k to keep)
[download] Finished downloading playlist: sun and moon above and beyond club mix
```

## Batch download

3. You can also paste a list of youtube/spotify URLs in `batch.txt` (1 per line) and it will be processed FIFO.

`./batch.sh`

## Scraping an entire Spotify Playlist

Note: If the playlist is over 150 songs you would need to do several snapshots (scroll down halfway and/or all the way down during the browser preview) and combine the csv into one file. Don't worry about duplicates, yt-dlp by default won't re-download existing songs.

### Installation

```bash
brew install chromedriver # or brew cask install chromedriver
pip install -U selenium
# Manual install
# Download for your architecture https://sites.google.com/chromium.org/driver/downloads?authuser=0
mv ~/Downloads/webdriver* /usr/local/bin/ # Move the webdriver into /usr/local/bin
```

### Batch spotify playlist workflow

```bash
python scraping2csv.py -u https://open.spotify.com/playlist/7jpP2XQ1C52509yPvyYxhi -o mix.csv
python csv2titles.py
./titles2mp3batch.sh # chmod +x ./titles2mp3batch.sh for the first time
```

Thanks to [lixx21](https://github.com/lixx21/spotify-scrapping) for the `scraping.py` base (which unfortunately didn't have infinite scroll working) I added in a "zoom out" to capture more songs at once.

## Next Steps

- Upload to ampache/plex through rsync?

## License

### The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

> [Github](https://github.com/bbershadsky/spotify-youtube-mp3)

> Made By [Boris Bershadsky](https://borisb.ca)
