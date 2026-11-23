# AGENTS.md — media

## What this is
Collection of shell scripts for media manipulation using command-line tools (extracting audio from YouTube, adding MP3 to MP4, looping MP4s, generating icons from SVG).

## Stack
- Shell (Bash)
- ffmpeg / youtube-dl family (command-line media tools)
- ImageMagick (`identify`, `convert`)

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
| 5 | `ask.d/mov_to_mp4.sh` | convert MOV to MP4 (H.264/AAC re-encode, faststart) |
| 6 | `ask.d/svg_print_size.sh` | print image size |
| 7 | `ask.d/svg_to_icons.sh` | convert SVG to 320/192/512/104/64/384 icons + favicons |

## Structure
- `ask.sh` — task switch (menu + dispatch, built from `ask.d/` headers)
- `ask.d/lib_path` — expands `~/...` paths from task prompts
- `ask.d/get_audio_from_youtube.sh` — download audio from YouTube
- `ask.d/add_mp3_to_mp4.sh` — mux MP3 into MP4
- `ask.d/loop_mp4.sh` — loop MP4 videos
- `ask.d/tim_audio.sh` — audio timing helper
- `ask.d/mov_to_mp4.sh` — convert MOV to MP4
- `ask.d/svg_print_size.sh` — print image dimensions
- `ask.d/svg_to_icons.sh` — generate icons/favicons from SVG

## Conventions
- No comments in code unless asked.
- Verify: `bash -n <script>`.
