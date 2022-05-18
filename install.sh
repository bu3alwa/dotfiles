#!/bin/env bash

for d in */ ; do
#    stow -D "$d"
    stow "$d"
done



