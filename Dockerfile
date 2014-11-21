
##
# Our runner container image contains:
#  * phusion/baseimage (https://github.com/phusion/baseimage-docker)
#  * heroku cedar-14 stack packages (https://github.com/heroku/stack-images)
#  * flynn/slugrunner script
##
FROM matter/app-base

MAINTAINER Iskandar N <iskandar@hellomatter.com>

# Set $HOME
# This appears to be ignored by phusion/baseimage;
# see https://github.com/phusion/baseimage-docker/issues/119
ENV HOME /app
WORKDIR /app

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# The lines below disable SSH, cron, and syslog
#RUN rm -rf /etc/service/sshd \
#    /etc/my_init.d/00_regen_ssh_host_keys.sh \
#    /etc/service/cron \
#    /etc/service/syslog-ng

# Add a slugrunner script
# RUN curl -sf -o /sbin/slugrunner -L \
#    https://raw.githubusercontent.com/flynn/flynn/db73f2b1526226bd168ee2266d2a1389b7cb3fca/slugrunner/runner/init
ADD ./slugrunner /sbin/slugrunner
RUN chmod +x /sbin/slugrunner

# Add ONBUILD to add the current directory as /app
# ONBUILD ADD . /app



