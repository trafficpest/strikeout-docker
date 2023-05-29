# Strikeout Docker Build Tool

Unzip or Git Strikeout to /app/strikeout directory.

From the Docker app root directory (should be a Dockerfile), build the image:
`docker build -t debian-slim:strikeout ./`

Then create and run the container:
`docker run -d -v $PWD/app:/app --name strikeout -p 80:80 -p 3306:3306 debian-slim:strikeout`

To stop the app container:
`docker stop strikeout`

To start the already created container:
`docker start strikeout`

