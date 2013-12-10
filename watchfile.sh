#!/usr/bin/env bash

cd ./src
./compile.coffee
open -g ../out/curriculum.html
