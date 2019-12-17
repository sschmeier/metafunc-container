set -ex

# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sebio
# image name
IMAGE=metafunc

docker build -t $USERNAME/$IMAGE:latest .
