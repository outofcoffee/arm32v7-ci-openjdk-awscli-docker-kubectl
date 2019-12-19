FROM arm32v7/adoptopenjdk:8-jdk-hotspot

ARG AWSCLI_VER="1.16.118"

# Install AWS CLI
RUN apt-get update -y && \
    apt-get install -y python-pip && \
    pip install awscli==${AWSCLI_VER} --upgrade --user

# Install kubectl
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl=1.14*

