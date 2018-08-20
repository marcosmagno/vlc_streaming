#!/bin/bash
#
#
#este comando deve ser rodado com o usuario WINET
#

cd ~/Documentos

vlc -vvv --color -I telnet --telnet-password 1 --telnet-host 0.0.0.0 --rtsp-port 5554 &
sleep 1

# carrega automaticamente os videos relacionados em videos1.vlm
./load_videos.sh

# na estacao deve rodar agora
# rtsp://150.164.10.54:5554/<nome do video>

