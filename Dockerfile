FROM public.ecr.aws/amazonlinux/amazonlinux:latest

RUN yum install -y amazon-linux-extras
RUN amazon-linux-extras install docker

RUN yum update -y && yum -y install docker unzip
RUN service docker start

RUN yum install 

# install aws-cli v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
