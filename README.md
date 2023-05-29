#Strikeout docker build tool

unzip or git strikeout to /app/strikeout dir

from this docker app root directory (should be a Dockerfile) build the image
`docker build -t debian-slim:strikeout ./`

then crete and run the container
`docker run -d -v $PWD/app:/app --name strikeout -p 80:80 -p 3306:3306 debian-slim:strikeout`

to stop the app container
`docker stop strikeout`

to start the already created container
`docker start strikeout`
