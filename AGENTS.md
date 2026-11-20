# AGENTS.md — media

## What this is
Collection of shell scripts for media manipulation using command-line tools (extracting audio from YouTube, adding MP3 to MP4, looping MP4s).

## Stack
- Shell (Bash)
- ffmpeg / youtube-dl family (command-line media tools)

## Run
`./ask.sh` shows the menu; the user runs it, the agent never does. Each task
prompts for its inputs and shows the old hardcoded values as defaults. Scripts
can also be run directly, e.g. `./ask.d/loop_mp4.sh`.

| ID | Script | Task |
|----|--------|------|
| 1 | `ask.d/get_audio_from_youtube.sh` | download audio from YouTube (`yt-dlp -f 140 --audio-format m4a`) |
| 2 | `ask.d/add_mp3_to_mp4.sh` | mux MP3 into MP4 |
| 3 | `ask.d/loop_mp4.sh` | loop MP4 videos |
| 4 | `ask.d/tim_audio.sh` | trim/convert audio (m4a → wav → mp3 via ffmpeg + sox) |

## Structure
- `ask.sh` — task switch (menu + dispatch, built from `ask.d/` headers)
- `ask.d/get_audio_from_youtube.sh` — download audio from YouTube
- `ask.d/add_mp3_to_mp4.sh` — mux MP3 into MP4
- `ask.d/loop_mp4.sh` — loop MP4 videos
- `ask.d/tim_audio.sh` — audio timing helper

## Conventions
- No comments in code unless asked.
- Verify: `bash -n <script>`.
