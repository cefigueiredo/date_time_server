#!/bin/bash
if [[ $# -eq 0 ]]
then
  mix run --no-halt
else
  PORT=$1 mix run --no-halt
fi
