# Polymer Docker
Docker image for Polymer development and deployment.

# Instruction

## Start a project

1. Create a subdirectory `foo` under `external` folder.

1. Run: `./polymer.sh foo init` then follow the prompt.

1. Run: `./polymer.sh foo serve` to serve the Polymer app in `foo`.

## Scripts

* Use `polymer.sh` to run `polymer` command from the docker environment.

* Use `run_cloud9_ide.sh` to run Cloud9 IDE.

* Use `utilities/run_image.sh` to start a bash environment in the docker.

* Use `utilities/stopall.sh` to stop all running environments.

* Use `utilities/clean_containers.sh` if you see a storage limit issue.
