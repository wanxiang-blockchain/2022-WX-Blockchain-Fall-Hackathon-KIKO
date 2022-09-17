#!/bin/bash
cd /Users/renjian/Desktop/code/move/kikoverse-contract-move
source ~/.zshrc
move clean
echo "excute clean"
move check
echo "excute check"
move publish
echo "excute publish"
