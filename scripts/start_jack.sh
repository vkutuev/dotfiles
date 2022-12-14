#!/bin/bash

jack_control start
jack_control ds alsa
jack_control dps device hw:PCH
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 256
sleep 1
a2j_control --ehw
a2j_control --start
pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source
pacmd set-default-sink jack_out
