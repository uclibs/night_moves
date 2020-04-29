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

This should result in a sample app preconfigured default workflows, adminset and sample users (admin and regular). See the [Dockerfile](https://github.com/uclibs/night_moves/blob/master/Dockerfile) for details.

### Test Users

username: admin@example.com, password: 'password'
username: test@example.com, password: 'password'

### Manage the container

Follow the logs
`docker logs -f night_moves`

Access the shell
`docker exec -it night_moves bash`

Access the shell as root
`docker exec -u root -it night_moves bash`

Access the rails console
`docker exec -it night_moves bundle exec rails c`

Stop the container
`docker stop night_moves`

Start the container
`docker start night_moves`

Remove the container (must be stopped)
`docker rm night_moves`
*Do this to blow away a corrupted container and start from scratch by creating a new container based on image*
