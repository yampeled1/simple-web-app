set -ex
# SET THE FOLLOWING VARIABLES
HOSTNAME=eu.gcr.io
# gcloud username
USERNAME=yampeled1
# image name
IMAGE=flask-app
# bump version
docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"
# building the image
docker build -t $USERNAME/$IMAGE:latest .
# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push --tags
docker tag $HOSTNAME/$USERNAME/$IMAGE:latest $HOSTNAME/$USERNAME/$IMAGE:$version
# push it
docker push $HOSTNAME/$USERNAME/$IMAGE:latest
docker push $HOSTNAME/$USERNAME/$IMAGE:$version
