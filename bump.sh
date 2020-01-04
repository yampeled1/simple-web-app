set -ex
# SET THE FOLLOWING VARIABLES
HOSTNAME=eu.gcr.io
# gcloud project
PROJECT_ID=yams-project-qwilt
# image name
IMAGE=flask-app
# bump version
docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"
# building the image
docker build -t $HOSTNAME/$PROJECT_ID/$IMAGE:latest .
# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push --tags
docker tag $HOSTNAME/$PROJECT_ID/$IMAGE:latest $HOSTNAME/$PROJECT_ID/$IMAGE:$version
# push it
gcloud docker push $HOSTNAME/$PROJECT_ID/$IMAGE:latest
gcloud docker push $HOSTNAME/$PROJECT_ID/$IMAGE:$version
