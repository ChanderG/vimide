# vimide

## vigode

Vi Golang Development environment is a Docker based workflow for Go development. Includes Vi and necessary plugins inside the image.

Look at documentation of the `vim-go` plugin. All IDE features come from it. 

### Instructions

Build the image using the included Dockerfile. Use the `runner.sh` script to run a container for a project.

The idea is to have a seperate $GOPATH folder for each Golang project. This folder on the host is mounted inside the container. This is in the usual form of the $GOPATH, with src/, pkg/ and bin/ directories.

All `go get`s after this will use this as the GOPATH.

So all development and dependencies are in this folder on the host mounted as a volume inside. You could use other tools from the outside, eg `git`.

The development container itself is ephermeral. Once you save the files inside, you can safetly exit and delete the container. Next run will create a fresh container and mount the GOPATH, so you can start using it directly.
