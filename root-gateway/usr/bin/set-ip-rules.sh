#!/bin/bash

ip rule add fwmark 0x161 lookup 100
ip rule add fwmark 0x162 lookup 100
ip route add local 0.0.0.0/0 dev lo table 100
