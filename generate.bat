mkdir output
ffmpeg -i ba.mp4 -f lavfi -i color=gray:s=480x360 -i ba.mp4 -f lavfi -i color=white:s=480x360 -filter_complex fps=15,threshold ".\output\%%04d.jpg"