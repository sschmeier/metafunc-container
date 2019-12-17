set -ex

# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sebio
# image name
IMAGE=metafunc

# ensure we're up to date
git pull

# bump version
sudo docker run --rm -v "$PWD":/app sebio/bump patch

version=`cat VERSION`
echo "version: $version"

# run build
./build.sh

# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags

sudo docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
sudo docker push $USERNAME/$IMAGE:latest
sudo docker push $USERNAME/$IMAGE:$version
