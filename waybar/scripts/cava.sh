#!/bin/bash
bar_custom="▁▂▃▄▅▆▇█"
dict="s/ //g;"
for i in $(seq 0 7); do
    dict="$dict s/$i/${bar_custom:$i:1}/g;"
done

cava -p <(cat <<EOF
[general]
bars =6
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF
) | sed -u "$dict"
