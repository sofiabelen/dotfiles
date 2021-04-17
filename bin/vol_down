VOLUME='-5%'
for SINK in `pacmd list-sinks | grep 'index:' | cut -b12-`
do
  pactl set-sink-volume $SINK $VOLUME
done
