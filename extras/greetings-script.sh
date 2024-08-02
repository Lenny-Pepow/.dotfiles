#! /etc/profiles/per-user/duque/bin/bash

APELIDO="$(shuf ~/.dotfiles/extras/greetings -n 1)"
echo "Boa noite, $APELIDO" | piper --model ~/.dotfiles/extras/pt_BR-faber-medium.onnx --output-raw | aplay -r 22050 -f S16_LE -t raw -
