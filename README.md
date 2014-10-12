
# matter/app-runner

A Docker app runner image.

Based on [matter/app-base](https://github.com/matter-automaton/app-base-docker), which is itself a mashup
of [phusion/baseimage](https://github.com/phusion/baseimage-docker)
and the [heroku cedar-14 stack](https://github.com/heroku/stack-images).

This image also includes the 'slug runner' init script from [flynn/slugrunner](https://github.com/flynn/flynn/tree/master/slugrunner).

The slug runner allows this image to run an app from any of these sources:

* A slug URL
* A local slug file
* A mounted filesystem directory



