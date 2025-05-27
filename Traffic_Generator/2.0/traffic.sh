#!/bin/sh


bash /fortipoc/ec_sim/fct_simulator.sh > /fortipoc/ec_sim/fct_simulator.txt &

while [ ! -f /fortipoc/ec_sim/simulation.xml ]; do
    sleep 2
done

python /fortipoc/traffic/traffic_simulator.py > /fortipoc/traffic/traffic_simulator.txt &
