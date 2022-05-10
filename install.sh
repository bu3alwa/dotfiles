#!/bin/env bash

for d in */ ; do
    stow -R "$d"
done



