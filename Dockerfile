FROM centos:7
MAINTAINER Jinhyuk Lee <jhlee@yellomobile.com>

RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN npm install -g forever