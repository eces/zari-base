FROM centos:7
MAINTAINER Jinhyuk Lee <jhlee@yellomobile.com>

# install git
RUN yum install -y git

# install node
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs

# install global npm dependencies
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN npm install -g forever

# pull
RUN git clone https://github.com/eces/hlabs.git --branch master --single-branch
RUN cd ./hlabs
RUN npm install --quiet
RUN bower install --allow-root --quiet
RUN grunt compile --quiet
ENV PORT=9000

# start server
RUN forever start -l hlabs.log -o out.log -e err.log -a app-hl.js

# # add init script
# ADD start.sh /tmp/
# RUN chmod +x /tmp/start.sh
# CMD ./tmp/start.sh