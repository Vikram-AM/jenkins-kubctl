FROM jenkins/inbound-agent:4.3-4-alpine
MAINTAINER mecodia GmbH

USER root
RUN apk update && \
    apk add curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client

USER jenkins
