FROM jenkinsci/jnlp-slave
MAINTAINER Travis Truman <trumant@gmail.com>

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV PATH /opt/google-cloud-sdk/bin:$PATH

USER root

# Install google-cloud-sdk
RUN apt-get update -y
RUN apt-get install -y jq git make
RUN curl https://sdk.cloud.google.com | bash && mv google-cloud-sdk /opt
RUN gcloud components install kubectl

# Install Helm
RUN wget http://storage.googleapis.com/kubernetes-helm/helm-v2.5.0-linux-amd64.tar.gz -P /tmp
RUN tar -zxvf /tmp/helm-v2.5.0-linux-amd64.tar.gz -C /tmp && mv /tmp/linux-amd64/helm /bin/helm && rm -rf /tmp