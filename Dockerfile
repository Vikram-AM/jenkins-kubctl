FROM jenkins/inbound-agent:4.13.2-1-alpine-jdk11
MAINTAINER mecodia GmbH

USER root
RUN apk update && \
    apk add curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
USER jenkins
