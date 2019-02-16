#! /usr/bin/env bash
image_name="chihchiu29/polymer-docker"

function show_usage() {
    echo
    echo "------------------------------------------------------------"
    echo "Usage reference:"
    echo "1) Run without arugments to start bash in docker."
    echo "3) Run with other subcommands to run them in docker."
    echo "------------------------------------------------------------"
    echo
    if [ x$(docker-machine ls --quiet) != "x" ]; then
      echo "IP: $(docker-machine ip default)"
    fi
}

show_usage

if [ $# == 0 ]
then
    echo
    echo "------------------------------------------------------------"
    echo "The external directory is mounted under /workspace/external."
    echo "------------------------------------------------------------"
    echo 
    docker run -it -p 8080:8080 -v $(pwd)/external:/workspace/external "${image_name}" bash
else
    echo
    echo "------------------------------------------------------------"
    echo "The external directory is mounted under /workspace/external."
    echo "------------------------------------------------------------"
    echo 
    docker run -it -p 8080:8080 -v $(pwd)/external:/workspace/external "${image_name}" "$@"
fi