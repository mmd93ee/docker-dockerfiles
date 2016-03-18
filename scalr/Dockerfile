#######################################################
#            Scalr base server build                  #
#                                                     #
#     Version: 1.0                                    #
#     Author: Matthew Dutton (dutton.matt@gmail.com)  #
#                                                     #
#                                                     #
#######################################################

FROM ubuntu:14.04
MAINTAINER Matthew Dutton <dutton.matt@gmail.com>

# Install base packages required by scalr
RUN apt-get install -y curl

#Install scalr packages
RUN curl -L https://packagecloud.io/install/repositories/scalr/scalr-server-oss/script.deb | sudo bash
RUN apt-get install -y scalr-server

#Post install configuration
#RUN hostname scalr <<< FAILS need to use dynamicdns and get name registered
RUN sudo /opt/scalr-server/bin/scalr-server-wizard

# Reload/restart all scalr components with the new configuration
RUN sudo /opt/scalr-server/bin/scalr-server-ctl reconfigure 

# Add shell to end of the startup script to keep the container alive
COPY scalr /etc/init.d/

# Do the do
CMD ["/etc/init.d/scalr", "start"]
#CMD ["/bin/bash"]
