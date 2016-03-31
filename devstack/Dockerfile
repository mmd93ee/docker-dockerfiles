#######################################################
#          DevStack base server build                 #
#                                                     #
#     Version: 1.0                                    #
#     Author: Matthew Dutton (dutton.matt@gmail.com)  #
#                                                     #
#                                                     #
#######################################################

FROM ubuntu:14.04
MAINTAINER Matthew Dutton <dutton.matt@gmail.com>


# Copy the installation script over
COPY configure-devstack-environment.sh /
RUN /bin/bash -c /configure-devstack-environment.sh






# Reinstall pip
#RUN sudo apt-get install python-pip -y 
#RUN sudo pip install --upgrade pip
#RUN sudo pip install --upgrade virtualenv

# Change folder permissions
#RUN mkdir /root/.cache
#RUN chmod 0777 /root/.cache



# Copy stuff
# COPY file target folder

# Map ports
# EXPOSE port port port

# To run by default
CMD ["/bin/bash", "-c", "sudo -H -u stack /devstack/stack.sh"]







