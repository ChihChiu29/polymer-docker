#! /usr/bin/env bash
image_name="chihchiu29/polymer-docker"

function show_usage() {
    echo
    echo "Usage: polymerd <subdir> <subcommand>"
    echo "Args:"
    echo "  subdir: the name of the subdirectory under 'external'."
    echo "  subcommand: the subcommand and arguments passed to 'polymer' command."
    echo "    A special subcommand is 'serve', and it serves at port 8080."
    echo
    if [ x$(docker-machine ls --quiet) != "x" ]; then
      echo "IP: $(docker-machine ip default)"
    fi
}

if [[ $# < 2 ]];
then
    show_usage
elif [[ $# == 2 ]] && [ $2 == "serve" ];
then
    echo
    echo "-------------------------------------------------------------------------------------------"
    echo "The ./external/"$1" directory is mounted under /workspace/external/$1."
    echo "-------------------------------------------------------------------------------------------"
    echo
    docker run -it -p 8080:8080 -v $(pwd)/external/$1:/workspace/external/$1 "${image_name}" \
        bash -c "cd $1; polymer serve --hostname 0.0.0.0 --port 8080"
else
    echo
    echo "-------------------------------------------------------------------------------------------"
    echo "The ./external/"$1" directory is mounted under /workspace/external/$1."
    echo "-------------------------------------------------------------------------------------------"
    docker run -it -p 8080:8080 -v $(pwd)/external/$1:/workspace/external/$1 "${image_name}" \
        bash -c "cd $1; polymer ${@:2}"
fi
