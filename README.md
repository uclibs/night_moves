# Night Moves : Dockerized Vanilla Hyrax app

Hyrax 2.6.0 based test application for UC Libraries App Dev Unit

*This is for dev/test purposes.*

### Setup

1. Clone the repo
  `git clone git@github.com:uclibs/night_moves.git`

1. Build the image
  `cd night_moves && docker build -t night_moves_image .`

1. Create container based on image.
  `docker run -d --name night_moves -p 3000:3000 -itP night_moves_image`

1. Wait a min or two and then visit [localhost:3000](http://localhost:3000) to access the app

### Manage the container

Stop the container
`docker stop night_moves`

Start the container
`docker start night_moves`

Access the shell
`docker exec -it night_moves bash`

Access the shell as root
`docker exec -u root -it night_moves bash`

Access the rails console
`docker exec -it night_moves bundle exec rails c`
