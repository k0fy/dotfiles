cd /home/jlgb/media/video

python  ~/bin/youtube-dl --download-archive /home/jlgb/media/video/descargados \
  --batch-file /home/jlgb/media/video/VIDEO \
  --write-sub \
  -i \
  -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
  --sub-lang eng,es \
  --audio-quality 0 \
  --audio-format best \
  --add-metadata \
  --mark-watched \
  -o "%(title)s.%(ext)s"